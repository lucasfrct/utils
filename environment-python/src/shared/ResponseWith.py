from flask import jsonify

##
# Criar uma padronização de respostas do servidor
class ResponseWith:

    def __init__(self, response = None):

        if(response is not None):

            if('status' in response):
                self.response = response
            else:
                self.response = { 'status': 200, 'data': response }
            
            self.statusResponse = self.handleStatus(self.response['status'])
            self.message = self.handleMessage(self.statusResponse, self.response)
    
    def json(self):
        return jsonify(self.message)
         
    def status(self):
        return self.statusResponse

    def handleStatus(self, status = None):
        status = int(status)

        if( status < 100 or status > 599 ):
            status = 500
        
        return status
    
    def handleMessage(self, status, response):
        
        message = { }

        if(status == 201 or status == 204):
            return message

        if(status >= 200 and status < 300):
            if('data' in response):
                return response['data']

        if(status >= 400):

            if('code' in response):
                message['code'] = response['code']
            
            if('message' in response):
                message['message'] = response['message']
        
        return message
