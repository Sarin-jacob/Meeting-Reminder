import pickle ,webbrowser,winsound,pymsgbox , datetime,time,threading

def ab() :  
    while a=='on' :
        winsound.PlaySound("c:/class_timer/sound/pleasant.wav",winsound.SND_ASYNC)
        time.sleep(3)
th = threading.Thread(target=ab)

def Save(dic,filename):
    with open(filename, 'wb') as handle:
        pickle.dump(dic, handle)

def Load(filename):
    with open(filename, 'rb') as handle:
       dic=pickle.load(handle)
    return dic

def new_data():
    li=[]
    link=dict()
    table={"Monday":dict(),"Tuesday":dict(),"Wednsday":dict(),"Thursday":dict(),"Friday":dict(),"Saturday":dict(),"Sunday":dict()}
    print('Enter time table  format :: course<space>hour<.>min eg:lab 14.30 \n')
    for i in table:
        a=input(f"Enter Courses and Timing(24hrs) for {i} \t press Enter after done\n")
        while a:
            o=a.split(' ')[-1]
            if int(o.split('.')[1])<10:
                o=o.split('.')[0]+'.'+o.split('.')[1][-1]
            table[i][o]=a.split(' ')[0]
            a=input()
        li.extend(list(table[i].values()))
    for i in set(li):
        link[i]=input(f"\nEnter Meeting link for {i} :\n")
    Save(link,"link")
    Save(table,"table")

def do() :
    global a
    table=Load("table")
    link=Load("link")
    wdy=list(table.keys())
    dy=datetime.date.today().weekday()
    today=table[wdy [dy]]
    print (today)
    while True:
        a='on'
        timy=datetime.datetime.now()
        if timy.hour==23:
            if timy.minute==59:
                dy=datetime.date.today().weekday() 
                today=table [wdy [dy]]
        now=f'{timy.hour}.{timy.minute}'
        if now in today:
            th.start()
            a=pymsgbox.confirm(f'Ready to join {today[now]} Class??', 'Class Ahead', ["Yep", 'Nope'])
            th.join()
            if a=="Yep":
                webbrowser.open(link [today [now]])
                time.sleep (60)


