package at.avdev.ruvixx.pojos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class IncidentType
{
    private Integer id;
    private String name;


    public IncidentType() {}

    public IncidentType(Integer id, String name)
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
        return "IncidentType{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
