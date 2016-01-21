package at.avdev.ruvixx.pojos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Status
{
    private Integer id;


    public Status() {}

    public Status(Integer id)
    {
        this.id = id;
    }


    public Integer getId()
    {
        return id;
    }

    public void setId(Integer id)
    {
        this.id = id;
    }

    @Override
    public String toString()
    {
        return "Status{" +
                "id=" + id +
                '}';
    }
}
