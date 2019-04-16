import socket, time, json

server = 'maximised-file-extraction.chal.cybears.io'
port = 2323
maxsize = 1440000


def knapSack(W , lfile, wt , val , n):

    # Base Case
    if n == 0 or W == 0 :
        return (0 , "")

    # If weight of the nth item is more than Knapsack of capacity
    # W, then this item cannot be included in the optimal solution
    if (wt[n-1] > W):
        return knapSack(W, lfile, wt , val , n-1)

    # return the maximum of two cases:
    # (1) nth item included
    # (2) not included
    else:
        (v1, fl1) = knapSack(W-wt[n-1] , lfile, wt , val , n-1)
        (v2, fl2) =  knapSack(W , lfile, wt , val , n-1)
        if val[n-1] + v1 > v2 :
            (w, fl) = (val[n-1] + v1, lfile[n-1] + ", " + fl1)
        else: 
            (w, fl) = (v2, fl2)
        
        return (w, fl)
        #return max(val[n-1] + knapSack(W-wt[n-1] , lfile, wt , val , n-1),
         #          knapSack(W , lfile, wt , val , n-1))

def max_string(lfile, lval, lsize):
    (v, fl) = knapSack(maxsize, lfile, lsize, lval, len(lval))
    return (v, fl[:-2])

def return_files(ldata):
    ln = len(ldata)
    lfile, lval, lsize, cnt = [], [], [], 0
    while cnt < ln :
        lfile.append(ldata[cnt])
        lval.append(ldata[cnt + 1])
        lsize.append(ldata[cnt + 2])
        cnt = cnt + 3
    
    return max_string(lfile, lval, lsize)

def return_file(app):
    jsfile = json.loads(app)
    l = []
    for key in jsfile.keys():
        l += (key, jsfile[key]['file_value'], jsfile[key]['file_size'])

    return return_files(l)

def connect_to_server():
        s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        s.connect((server, port))
        f = False
        app = ""
        while 1:
          data = s.recv(1024)
          if data == 'START_FILE_LIST\n' : 
              f = True
              continue

          if data == 'END_FILE_LIST\n' : 
              f = False
              print app
              (v, fl) = return_file(app)
              print "I am sending the files\n"
              s.send(fl)
              continue

          if f :
             app = app + data
          if data == "":
             break

          print repr(data)

        
        
connect_to_server()
