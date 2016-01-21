package at.avdev.ruvixx.pojos;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

@JsonIgnoreProperties(ignoreUnknown = true)
public class IdentifiedUnknownProduct
{
    private Product product;
    @JsonProperty("qty")
    private Integer quantity;
    private Double amount;
    private List<Technology> technologies;


    public IdentifiedUnknownProduct() {}

    public IdentifiedUnknownProduct(Product product, Integer quantity, Double amount, List<Technology> technologies)
    {
        this.product = product;
        this.quantity = quantity;
        this.amount = amount;
        this.technologies = technologies;
    }


    public Product getProduct()
    {
        return product;
    }

    public void setProduct(Product product)
    {
        this.product = product;
    }

    public Integer getQuantity()
    {
        return quantity;
    }

    public void setQuantity(Integer quantity)
    {
        this.quantity = quantity;
    }

    public Double getAmount()
    {
        return amount;
    }

    public void setAmount(Double amount)
    {
        this.amount = amount;
    }

    public List<Technology> getTechnologies()
    {
        return technologies;
    }

    public void setTechnologies(List<Technology> technologies)
    {
        this.technologies = technologies;
    }

    @Override
    public String toString()
    {
        return "IdentifiedUnknownProduct{" +
                "product=" + product +
                ", quantity=" + quantity +
                ", amount=" + amount +
                ", technologies=" + technologies +
                '}';
    }
}
