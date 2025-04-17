from fastapi import FastAPI
from typing import List
import mysql.connector
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# Enable CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Database connection configuration
db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',  # Change this to your MySQL password
    'database': 'DuLieu'
}

@app.get("/api/giang-vien/{ten_bo_mon}")
async def get_giang_vien(ten_bo_mon: str):
    try:
        # Create connection
        conn = mysql.connector.connect(**db_config)
        cursor = conn.cursor(dictionary=True)
        
        # SQL query using LIKE for approximate matching
        query = """
            SELECT gv.MaGV, gv.TenGV, bm.TenBM, gv.GioiTinh, gv.DiaChi, gv.SoDT
            FROM tblGV gv
            JOIN tblBoMon bm ON gv.BoMon = bm.MaBM
            WHERE bm.TenBM LIKE %s
        """
        
        # Execute query with parameter
        cursor.execute(query, (f'%{ten_bo_mon}%',))
        
        # Fetch results
        results = cursor.fetchall()
        
        # Close connection
        cursor.close()
        conn.close()
        
        return {"status": "success", "data": results}
        
    except Exception as e:
        return {"status": "error", "message": str(e)}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)