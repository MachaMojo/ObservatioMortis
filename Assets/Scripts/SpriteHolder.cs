using UnityEngine;

public class SpriteHolder : MonoBehaviour
{
    [SerializeField] private Sprite sprite0;
    [SerializeField] private Sprite sprite1;
    [SerializeField] private Sprite sprite2;
    [SerializeField] private Sprite sprite3;
    [SerializeField] private Sprite sprite4;
    [SerializeField] private SpriteRenderer spriteRenderer;

    void Start()
    {
        spriteRenderer.sprite = sprite0;
    }

    public void ChangeSprite(int id)
    {
        switch (id)
        {
            case 0:
                spriteRenderer.sprite = sprite0;
                break;
            case 1:
                spriteRenderer.sprite = sprite1;
                break;
            case 2:
                spriteRenderer.sprite = sprite2;
                break;
            case 3:
                spriteRenderer.sprite = sprite3;
                break;
            case 4:
                spriteRenderer.sprite = sprite4;
                break;
        }
    }
}
