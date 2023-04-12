
def handler(event, context):
    bucket = event['detail']['requestParameters']['bucket_name']

    print(f'Bucket created: {bucket}')

    return {
        'statusCode': 200,
        'body': f'Bucket {bucket} creation processed'
    }
