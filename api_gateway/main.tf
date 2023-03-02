

resource "aws_api_gateway_rest_api" "my_api_gateway" {
  name = "my_api_gateway-api"
}

resource "aws_api_gateway_resource" "my_api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.my_api_gateway.id
  parent_id   = aws_api_gateway_rest_api.my_api_gateway.root_resource_id
  path_part   = "my_api_gateway"
}

resource "aws_api_gateway_method" "my_api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.my_api_gateway.id
  resource_id = aws_api_gateway_resource.my_api_gateway.id
  http_method = "GET"
  authorization = "NONE" 
  
}


resource "aws_api_gateway_integration" "my_api_gateway" {
  rest_api_id             = aws_api_gateway_rest_api.my_api_gateway.id
  resource_id             = aws_api_gateway_resource.my_api_gateway.id
  http_method             = aws_api_gateway_method.my_api_gateway.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "arn:aws:apigateway:${var.region}:lambda:path/2015-03-31/functions/${var.lambda_arn}/invocations"
}

resource "aws_lambda_permission" "my_api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name =  var.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn    = "arn:aws:execute-api:${var.region}:${var.account_id}:${aws_api_gateway_rest_api.my_api_gateway.id}/*/*/my_api_gateway"
  
}

resource "aws_api_gateway_method_response" "my_api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.my_api_gateway.id
  resource_id = aws_api_gateway_resource.my_api_gateway.id
  http_method = aws_api_gateway_method.my_api_gateway.http_method
  status_code = "200"
}

resource "aws_api_gateway_integration_response" "my_api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.my_api_gateway.id
  resource_id = aws_api_gateway_resource.my_api_gateway.id
  http_method = aws_api_gateway_method.my_api_gateway.http_method
  status_code = aws_api_gateway_method_response.my_api_gateway.status_code
}

resource "aws_api_gateway_deployment" "my_api_gateway" {
  rest_api_id = aws_api_gateway_rest_api.my_api_gateway.id
  depends_on  = [aws_api_gateway_integration.my_api_gateway, aws_api_gateway_method_response.my_api_gateway, aws_api_gateway_integration_response.my_api_gateway]
  stage_name  = "prod"
}




