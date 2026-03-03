from app.main import app

def test_home_route():
    client = app.test_client()
    response = client.get('/')
    
    # If the website crashes, this will fail and stop the deployment
    assert response.status_code == 200
    
    # Check if our expected message is in the response
    json_data = response.get_json()
    assert "message" in json_data
