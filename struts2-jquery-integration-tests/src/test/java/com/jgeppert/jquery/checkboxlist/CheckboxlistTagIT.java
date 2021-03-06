package com.jgeppert.struts2.jquery.checkboxlist;

import com.jgeppert.struts2.jquery.selenium.JQueryIdleCondition;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;

import org.openqa.selenium.Alert;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.htmlunit.HtmlUnitDriver;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

@RunWith(Parameterized.class)
public class CheckboxlistTagIT {
    @Parameterized.Parameters
    public static Collection<Object[]> data() {
        return Arrays.asList(new Object[][] {
                 { "http://localhost:8080/regular" }, 
                 { "http://localhost:8080/uncompressed" },
                 { "http://localhost:8080/loadatonce" }, 
                 { "http://localhost:8080/loadfromgoogle" }  
           });
    }
    
    private static final JQueryIdleCondition JQUERY_IDLE = new JQueryIdleCondition();

    private String baseUrl;        

    public CheckboxlistTagIT(final String baseUrl) {
        this.baseUrl = baseUrl;
    }

    @Test
    public void testInlineData() {
        WebDriver driver = new HtmlUnitDriver(true);
        WebDriverWait wait = new WebDriverWait(driver, 30);

        driver.get(baseUrl + "/checkboxlist/inlinedata.action");

        wait.until(JQUERY_IDLE);

        List<WebElement> checkboxes = driver.findElements(By.xpath("//div[@id='checkboxbuttonset']/input[@type='checkbox'][@name='days']"));

        Assert.assertEquals(7, checkboxes.size());
    }

    @Test
    public void testRemoteListData() {
        WebDriver driver = new HtmlUnitDriver(true);
        WebDriverWait wait = new WebDriverWait(driver, 30);

        driver.get(baseUrl + "/checkboxlist/remotelist.action");

        wait.until(JQUERY_IDLE);

        List<WebElement> checkboxes = driver.findElements(By.xpath("//div[@id='checkboxbuttonset']/input[@type='checkbox'][@name='letters']"));

        Assert.assertEquals(26, checkboxes.size());
    }
}

