# GPT Medium Bot
This repository contains codes for a bot that generates blog posts about random topics using GPT-3 and publishes it on Medium and Twitter.

## Links to generated blog posts:
Medium: https://medium.com/@developer.gptbot <br />
Twitter: https://twitter.com/gptmediumbot <br />

## Generate blog post
To generate the blog post OpenAI's text-davinci engine is used. To use it you need to create an account at OpenAI and get an API_KEY to use it with Python.
Two prompts are used: one to generate a blog title and another one to generate the blog body based on the generated title. The bot keeps track of already written blogs and gave the list to the initial prompt to ensure that the same blog post is not generated twice.

## Publish on Medium
To automatically publish the article on Medium the following repo is used: <br />
https://github.com/kaili-chen/writing-supplements/tree/master/publish%20to%20medium%20via%20cli <br />
A Medium account is needed and an integration token has to be obtained from Medium to use it with Python.
 
## Post on twitter
To post on Twitter the tweepy package is utilized. Several authentication keys are needed to be able to post on Twitter.
 
## Automate posting every day
AWS EC2 webservices are used to automate the blog posting. For that an AWS account is needed. An instance template with a bash script that automatically starts a t2.micro instance is used. It runs the python code and uploads the generated blogpost to AWS S3. The template is automatically started using AWS Lambda to start the template and AWS Eventbridge to schedule the Lambda execution. It is also possible to setup a notifcation service to send an email to make sure that the instance automatically shuts down after it is finished.
Here are a couple of useful links to setup AWS:
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html
- https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/ec2.html#instance <br />
The setup.sh file is run at instance start.

## Credentials
Credentials for Medium, Twitter, Email exception and OpenAI are in "config.py" and "config.json" files (not part of this repository).
