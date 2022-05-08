Received: from server.euro-space.net (server.euro-space.net [87.117.250.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2CB1879
	for <chrome-platform@lists.linux.dev>; Sun,  8 May 2022 21:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=enKuQ8Lxz3Vmf8dpbbmnpEMeOx7tjLz+buX9syc5yZ4=; b=sukxMNUG1Ojoy7irTnr/sFq6Qx
	hmL+VR8IC1lmHDBuncP/m0KfvOB7QzgcoCs+1vHIOjiXXEOW/++GlPkHM/Ibx+1jHXLFecAT8YlJh
	1q8wxC35N3WxiGqkjB7Er/vW2qRa0syY1VE1o65qbu7tixJTABkuFL02uSz9Xajp5vqroI8mtPumn
	XRy/w8RXBIflyAMN16lz8YPd4nTUI2TqmVYkbem3z7myeN4vKoqtUHwkqx8jbkL1QE4bY+ZKLpi9x
	QrkXBNTqDHcsR9Tovp/cpj1YHPczYKREFsIcfJ4PBgWcrI7RX9qXPO+BN8tKHxbRzGQKNISkCExBj
	lYKP74Sg==;
Received: from dynamic-176-002-223-001.176.2.pool.telefonica.de ([176.2.223.1]:38050 helo=localhost.localdomain)
	by server.euro-space.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <kmarinushkin@birdec.com>)
	id 1nnnbj-00037D-Py;
	Sun, 08 May 2022 21:34:23 +0100
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the endianness
 flag
To: Charles Keepax <ckeepax@opensource.cirrus.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, codrin.ciubotariu@microchip.com, lars@metafoo.de,
 cychiang@chromium.org, tzungbi@google.com, bleung@chromium.org,
 matthias.bgg@gmail.com, oder_chiou@realtek.com,
 steven.eckhoff.opensource@gmail.com, srinivas.kandagatla@linaro.org,
 alexandre.belloni@bootlin.com, kuninori.morimoto.gx@renesas.com,
 jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
 chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org,
 patches@opensource.cirrus.com
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
From: Kirill Marinushkin <kmarinushkin@birdec.com>
Message-ID: <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
Date: Sun, 8 May 2022 22:34:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.euro-space.net
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - birdec.com
X-Get-Message-Sender-Via: server.euro-space.net: authenticated_id: kmarinushkin@birdec.com
X-Authenticated-Sender: server.euro-space.net: kmarinushkin@birdec.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-From-Rewrite: unmodified, already matched

Hello Charles,

In the [PATCH 00/38] of this patch set, you write:

 > 2) Devices behind non-audio buses, SPI just moves bits and doesn't
 > really define an endian for audio data on the bus. Thus it seems the
 > CODEC probably can care about the endian. The only devices that fall
 > into this group (mostly for AoV) are: rt5514-spi.c, rt5677-spi.c,
 > cros_ec_codec.c (only the AoV).

 From my experience with some PCM codecs by TI, they can not care about the

endianness. For example, in driver [1], if I allow BE format as well, 
and configure

the sound card to use BE, it will not work. I have no sound with BE.

In these cases, the codec HW supports *only* LE. That's why their 
`snd_soc_dai_driver`

structures provide only LE in the `format` field.

If such drivers specify `endianness = 1`, then `soc-core` will extend 
their supported

formats with BE counter-parts, see [2]. AFAIU, it will have the same 
effect, as if the

drivers themselves provided their formats in both LE | BE.


I don't think adding `endianness = 1` to such codecs will work as expected.

Unfortunately, I don't have an easy access to HW today, to confirm or 
disprove

this understanding.


Best regards,

Kirill

---

[1] 
https://elixir.bootlin.com/linux/latest/source/sound/soc/codecs/pcm3060.c#L189

[2] 
https://elixir.bootlin.com/linux/latest/source/sound/soc/soc-core.c#L2540


On 5/4/22 7:08 PM, Charles Keepax wrote:
> Add a comment to make the purpose of the endianness flag on the
> snd_soc_component structure more clear.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>   include/sound/soc-component.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 766dc6f009c0b..5a764c3099d3e 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -169,6 +169,15 @@ struct snd_soc_component_driver {
>   	unsigned int idle_bias_on:1;
>   	unsigned int suspend_bias_off:1;
>   	unsigned int use_pmdown_time:1; /* care pmdown_time at stop */
> +	/*
> +	 * Indicates that the component does not care about the endianness of
> +	 * PCM audio data and the core will ensure that both LE and BE variants
> +	 * of each used format are present. Typically this is because the
> +	 * component sits behind a bus that abstracts away the endian of the
> +	 * original data, ie. one for which the transmission endian is defined
> +	 * (I2S/SLIMbus/SoundWire), or the concept of endian doesn't exist (PDM,
> +	 * analogue).
> +	 */
>   	unsigned int endianness:1;
>   	unsigned int non_legacy_dai_naming:1;
>   
