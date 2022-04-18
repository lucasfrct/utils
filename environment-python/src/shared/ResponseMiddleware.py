from functools import wraps
from .ResponseWith import ResponseWith

##
# Criar uma padronização de respostas do servidor
def ResponseMiddleware():
    def _ResponseMiddleware(f):
        @wraps(f)
        def __ResponseMiddleware(*args, **kwargs):

            # before 
            #print('before middleware')

            result = f(*args, **kwargs)
            # print('middleware result: %s' % result)

            #after
            #print('after middleware')
            response = ResponseWith(result)
            
            return response.json(), response.status()

        return __ResponseMiddleware
    return _ResponseMiddleware