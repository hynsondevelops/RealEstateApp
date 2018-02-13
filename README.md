# RealEstateApp
A real estate listing application similar to Zillow.com or Realtor.com. Uses Ruby on Rails with a Postgresql database and Bootstrap styling. Database includes information on all fifty United States including over 60,000 zipcodes and 40,000 cities. Allows for listing for rent or sale with a user profile that allows email communication. 

# Demo
You can see a running version of the application at [https://real-estate-finder.herokuapp.com/](https://real-estate-finder.herokuapp.com/).

## Features
**Users**

Utilizes Devise to create user accounts that can be used by both buyers and sellers. 

**Listings**

Creating a listing allows for specifying either a rental or for sale listing. 

Allows for address, zipcode, city, state, number of bedrooms, number of bathrooms, price, and text description.

Can attach as many pictures as desired to be displayed in a carousel on the listing page. 

**Search**

Allows for searching through all listings in the database through the search navbar. Address information can be searched by entering any parts or all of a street address. 

Allows for setting upper and lower bounds on the price and square feet. 

Allows for setting lower bounds on the number of bedrooms and/or bathrooms.

**Example:** Searching for "2106", "Harmony Woods Rd", or "2106 Harmony Woods Rd" all will return the listing for 2106 Harmony Woods Rd. 

## Built With

* [Ruby On Rails](http://rubyonrails.org/) - The web framework used
* [Bootstrap](https://getbootstrap.com/) - Front end design
* [GoogleMapsAPIs](https://developers.google.com/maps/) - Mapping out listings on Google Maps

## Authors

* **Adam Hynson** - *Developer* - [Github](https://github.com/hynsondevelops) - [Portfolio](https://hynson-tech-blog.herokuapp.com/portfolio) - [Blog](https://hynson-tech-blog.herokuapp.com/posts)