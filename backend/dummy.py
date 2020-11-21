from app import db
from time import sleep


def clean():
    db.drop_all()
    db.create_all()
    food = [
        {
            'name': 'Himalayan Samosa',
            'price': '30',
            'owner': '1',
        },
        {
            'name': 'Misal Pav',
            'price': '30',
            'owner': '1',
        },
        {
            'name': 'Special Maggi',
            'price': '25',
            'owner': '1',
        },{
            'name': 'Mix Bhaji',
            'price': '20',
            'owner': '2',
        },
        {
            'name': 'Batat Wado',
            'price': '20',
            'owner': '2',
        },
        {
            'name': 'Noodles',
            'price': '100',
            'owner': '3'
        }
    ]

    Restaurants = [
        {
            'name':'Umesh',
            'address': 'Ponda',
            'latitude': '15.25233',
            'longitude': '73.58533',

        },
        {
            'name':'Gauthankar',
            'address': 'Bicholim',
            'latitude': '15.5881405',
            'longitude': '73.9479934',

        },
        {
            'name':'J.K.',
            'address': 'Sanquelim',
            'latitude': '15.557915',
            'longitude': ' 74.020149',

        }
    ]

    import requests


    for i in Restaurants:
        a = requests.post(f'http://127.0.0.1:5000/business',json=i)

    for i in food:
        a = requests.post('http://127.0.0.1:5000/food',json=i)

    a = requests.post('http://127.0.0.1:5000/deli',json={'name':'Flash','latitude':15.390958,'longitude':73.996138,'phone':1234})
    print(a)
    a = requests.post('http://127.0.0.1:5000/deli',json={'name':'Flash2','latitude':15.560644,'longitude':74.013183,'phone':1234})
    print(a)
    a = requests.post('http://127.0.0.1:5000/deli',json={'name':'Flash3','latitude':15.591070,'longitude': 73.947190,'phone':1234})
    print(a)
    a = requests.post('http://127.0.0.1:5000/order',json={
        'client':'1',
        'restaurant':'2',
        'foodList':{1:2,2:2,3:2},
        'status': 'done',
        'latitude':15.591354,
        'longitude':73.946276
    })
    print(a)
    print(requests.get('http://127.0.0.1:5000/deli').text)

if __name__=='__main__':
    clean()