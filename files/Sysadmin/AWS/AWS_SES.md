# SES

## Handling bounces, complaints and deliveries

### Procedure

#### Create SNS topics

- Create an SNS "ses-bounces-topic".
- Create an SNS "ses-complaints-topic".
- Create an SNS "ses-deliveries-topic".

#### Create SQS queues

- Create an SQS "ses-bounces-queue".
- Create an SQS "ses-complaints-queue".
- Create an SQS "ses-deliveries-queue".

#### Configure SQS queues

- Configure "ses-bounces-queue" to subscribe to "ses-bounces-topic".
- Configure "ses-complaints-queue" to subscribe to "ses-complaints-topic".
- Configure "ses-deliveries-queue" to subscribe to "ses-deliveries-topic".

#### Configure SES

- For a domain, configure SES to publish bounce notifications to "ses-bounces-topic".
- For a domain, configure SES to publish complaint notifications to "ses-complaints-topic".
- For a domain, configure SES to publish delivery notifications to "ses-deliveries-topic".

#### Processor development

- Develop the bounce processor (with AWS SKD, get bounces and process them).
- Develop the complaints processor (with AWS SKD, get complaints and process them).
- Develop the deliveries processor (with AWS SKD, get deliveries and process them).
