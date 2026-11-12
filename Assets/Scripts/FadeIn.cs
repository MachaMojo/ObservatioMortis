using System.Collections;
using UnityEngine;

public class FadeIn : MonoBehaviour
{
    public float fadeDuration = 2.0f;
    private SpriteRenderer spriteRenderer;

    void Start()
    {
        spriteRenderer = GetComponent<SpriteRenderer>();
        
        SetAlpha(0f);       
    }

    public void Appear()
    {
        StartCoroutine(Fade(false));
    }

    public void Disappear()
    {
        StartCoroutine(Fade(true));
    }


    IEnumerator Fade(bool disappear)
    {
        float counter = 0f;
        if (disappear)
        {
            while (counter < fadeDuration)
            {
                counter += Time.deltaTime;
                float alpha = Mathf.Lerp(1f, 0f, counter / fadeDuration);
                SetAlpha(alpha);
                yield return null;
            }
        }
        else
        {
            while (counter < fadeDuration)
            {
                counter += Time.deltaTime;
                float alpha = Mathf.Lerp(0f, 1f, counter / fadeDuration);
                SetAlpha(alpha);
                yield return null;
            }
        }
        
    }

    private void SetAlpha(float alpha)
    {
        if (spriteRenderer != null)
        {
            Color color = spriteRenderer.material.color;
            color.a = alpha;
            spriteRenderer.color = color;
        }
    }
}
