using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

public class KillScreen : MonoBehaviour
{
    // public AudioSource audioSource;
    // public AudioClip gore;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        StartCoroutine(KillAndUnload());
    }

    IEnumerator KillAndUnload()
    {
        GameManager.Instance.paused = true;
        //audioSource.PlayOneShot(gore);
        yield return new WaitForSeconds(3f);
        GameManager.Instance.paused = false;
        SceneManager.UnloadSceneAsync("KillScreen");
    }

}
