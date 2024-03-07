import boto3
from botocore.exceptions import ClientError


def start_ssm_session(instance_id):
    try:
        ssm_client = boto3.client('ssm')
        response = ssm_client.start_session(
            Target=instance_id
        )
        session_id = response['SessionId']
        print(f"Started SSM session for instance {instance_id}. Session ID: {session_id}\n")
    except ClientError as e:
        print(f"Failed to start SSM session for instance {instance_id}: {e}\n")

def main():
    # Initialize the EC2 client
    ec2_client = boto3.client('ec2')

    # Get all instances
    response = ec2_client.describe_instances()

    # Extract instance IDs with specified names
    instance_ids = []
    for reservation in response['Reservations']:
        for instance in reservation['Instances']:
            for tag in instance['Tags']:
                if tag['Key'] == 'Name':
                    name = tag['Value']
                    if 'NGINX' in name or 'Cache' in name or 'Tomcat' in name or 'Offloading' in name:
                        instance_ids.append(instance['InstanceId'])
    print("The Total count of servers - "+str(len(instance_ids))+"\n")

    for instance_id in instance_ids:
        start_ssm_session(instance_id)

if __name__ == "__main__":
    main()
