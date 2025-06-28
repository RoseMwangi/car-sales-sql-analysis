# 📘 Data Dictionary — Car Sales Dataset

This dataset includes detailed records of car sales across different states, sellers, and vehicle types.

| Column Name    | Description                                                                 |
|----------------|-----------------------------------------------------------------------------|
| `year`         | Year of manufacture of the car                                              |
| `make`         | Manufacturer/brand of the car (e.g., Ford, BMW)                            |
| `model`        | Model name of the car                                                       |
| `trim`         | Specific trim level or variant of the car model                            |
| `body`         | Body type of the car (e.g., SUV, Sedan)                                     |
| `transmission` | Type of transmission (automatic, manual, etc.)                              |
| `vin`          | Vehicle Identification Number (unique ID for each car)                      |
| `state`        | State where the car was sold                                                |
| `condition`    | Numeric condition rating (higher = better condition)                        |
| `odometer`     | Mileage on the car at the time of sale (in miles)                           |
| `color`        | Exterior color of the car                                                   |
| `interior`     | Interior color of the car                                                   |
| `seller`       | Name of the seller (e.g., dealership, leasing company)                      |
| `mmr`          | Manheim Market Report value — estimated wholesale price                     |
| `sellingprice` | Final price the car was sold for                                            |
| `saledate`     | Original sale date in string format (later parsed into date/timestamp)      |

---

🛠️ Notes:
- `saledate` was cleaned and converted to a timestamp during analysis
- `odometer` was grouped into buckets (Very Low, Low, Medium, High)
- `color` entries were standardized (e.g., removing dashes or blanks)

