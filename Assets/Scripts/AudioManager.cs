using UnityEngine;

public class AudioManager : MonoBehaviour
{
    public static AudioManager Instance { get; private set; }
    public AudioSource audioSource;
    public AudioClip select;
    public AudioClip advance;
    public AudioClip lockin;
    public AudioClip close;
    public AudioClip startday;
    public AudioClip invalid;
    
    [SerializeField] private AudioClip singleshot, multishot, attack, bigattack, empdeath;
    // Start is called once before the first execution of Update after the MonoBehaviour is created
    private void Awake()
    {
        if (Instance != null && Instance != this)
        {
            Destroy(gameObject);
            return;
        }

        Instance = this;
        DontDestroyOnLoad(gameObject);
    }

    // Update is called once per frame
    public void Play(AudioClip clip)
    {
        audioSource.PlayOneShot(clip);
    }

    public void PlayID(int ID)
    {
        switch (ID)
        {
            case 0: 
                audioSource.PlayOneShot(singleshot);
                break;
            case 1:
                audioSource.PlayOneShot(multishot);
                break;
            case 2:
                audioSource.PlayOneShot(attack);
                break;
            case 3:
                audioSource.PlayOneShot(bigattack);
                break;
            case 4:
                audioSource.PlayOneShot(empdeath);
                break;
        }
    }
}
