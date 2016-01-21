package at.avdev.ruvixx.pojos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ReportingEntity
{
    private String name;


    public ReportingEntity() {}

    public ReportingEntity(String name)
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
        return "ReportingEntity{" +
                "name='" + name + '\'' +
                '}';
    }
}
