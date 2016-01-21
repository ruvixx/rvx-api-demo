package at.avdev.ruvixx.pojos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class InfringementType
{
    private Integer id;
    private String name;


    public InfringementType() {}

    public InfringementType(Integer id, String name)
    {
        this.id = id;
        this.name = name;
    }


    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
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
        return "InfringementType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
