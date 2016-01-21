package at.avdev.ruvixx.pojos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Country
{
    private String name;


    public Country() {}

    public Country(String name)
    {
        this.name = name;
    }


    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    @Override
    public String toString()
    {
        return "Country{" +
                "name='" + name + '\'' +
                '}';
    }
}
