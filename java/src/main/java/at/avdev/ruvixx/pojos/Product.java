package at.avdev.ruvixx.pojos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Product
{
    private String model;
    private String brand;


    public Product() {}

    public Product(String model, String brand)
    {
        this.model = model;
        this.brand = brand;
    }


    public String getModel()
    {
        return model;
    }

    public void setModel(String model)
    {
        this.model = model;
    }

    public String getBrand()
    {
        return brand;
    }

    public void setBrand(String brand)
    {
        this.brand = brand;
    }

    @Override
    public String toString()
    {
        return "Product{" +
                "model='" + model + '\'' +
                ", brand='" + brand + '\'' +
                '}';
    }
}
