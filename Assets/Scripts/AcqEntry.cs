using UnityEngine;
using TMPro;
using UnityEngine.EventSystems;
using UnityEngine.UI;
using System;

public class AcqEntry : MonoBehaviour, IPointerClickHandler
{
    [SerializeField] private Image image;
    [SerializeField] private TMP_Text desc;
    public GameObject selectionMenu;
    public void Setup(Sprite icon, string text, GameObject menu)
    {
        image.sprite = icon;
        desc.text = text;
        selectionMenu = menu;
        selectionMenu.SetActive(false);
    }

    public void OnPointerClick(PointerEventData eventData)
    {
        AudioManager.Instance.Play(AudioManager.Instance.select);
        selectionMenu.SetActive(!selectionMenu.activeInHierarchy);
    }
}
