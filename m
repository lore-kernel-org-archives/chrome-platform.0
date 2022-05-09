Received: from server.euro-space.net (server.euro-space.net [87.117.250.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D0D7B
	for <chrome-platform@lists.linux.dev>; Mon,  9 May 2022 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4u47BCK/790knsR75bTXA4NpiHdmdj09wJGyi2xvp1U=; b=Qf7v34GY+puhb0gRv16vvTmvsv
	f2pibIAGEe9eFJDAncn9/HMmE/g/X2tf/SrNwb43Hklz1cIrtjaa4dIgDGZYhOiuRr1cN/MU1MLbD
	MoAd/ro5DESEhV+hRfUAkiRGrd4l+hQ7B1J6B9AFys8tTPuuvsPuraAD6ApO0A6nJLIeCA1+0ml+Q
	44Xjl0DRM55CTXs1mhHWdUY1eayxmqgtqXptUtxJFoK85Hg907+0Y/AakY4cPY+4/wpJWdPq/a8Bh
	CjrG4glnkWOLgW79158Qwe5aBwMg+sdYG6sQTvRF5XNiHtHROHJ0TL4i1rFnaeHAW+jK08SnecIXz
	xkw/QpQg==;
Received: from dynamic-176-002-223-001.176.2.pool.telefonica.de ([176.2.223.1]:46096 helo=localhost.localdomain)
	by server.euro-space.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <kmarinushkin@birdec.com>)
	id 1no8xy-000CJF-Ks;
	Mon, 09 May 2022 20:22:47 +0100
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the endianness
 flag
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, codrin.ciubotariu@microchip.com,
 lars@metafoo.de, cychiang@chromium.org, tzungbi@google.com,
 bleung@chromium.org, matthias.bgg@gmail.com, oder_chiou@realtek.com,
 steven.eckhoff.opensource@gmail.com, srinivas.kandagatla@linaro.org,
 alexandre.belloni@bootlin.com, kuninori.morimoto.gx@renesas.com,
 jiaxin.yu@mediatek.com, alsa-devel@alsa-project.org,
 chrome-platform@lists.linux.dev, linux-mediatek@lists.infradead.org,
 patches@opensource.cirrus.com
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
From: Kirill Marinushkin <kmarinushkin@birdec.com>
Message-ID: <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
Date: Mon, 9 May 2022 21:22:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20220509083729.GX38351@ediswmail.ad.cirrus.com>
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

On 5/9/22 10:37 AM, Charles Keepax wrote:
> On Sun, May 08, 2022 at 10:34:12PM +0200, Kirill Marinushkin wrote:
>> In the [PATCH 00/38] of this patch set, you write:
>>> 2) Devices behind non-audio buses, SPI just moves bits and doesn't
>>> really define an endian for audio data on the bus. Thus it seems the
>>> CODEC probably can care about the endian. The only devices that fall
>>> into this group (mostly for AoV) are: rt5514-spi.c, rt5677-spi.c,
>>> cros_ec_codec.c (only the AoV).
>>  From my experience with some PCM codecs by TI, they can not care about the
>> endianness. For example, in driver [1], if I allow BE format as
>> well, and configure
>> the sound card to use BE, it will not work. I have no sound with BE.
>> In these cases, the codec HW supports *only* LE. That's why their
>> `snd_soc_dai_driver`
>> structures provide only LE in the `format` field.
>> If such drivers specify `endianness = 1`, then `soc-core` will
>> extend their supported
>> formats with BE counter-parts, see [2]. AFAIU, it will have the same
>> effect, as if the
>> drivers themselves provided their formats in both LE | BE.
>>
>> I don't think adding `endianness = 1` to such codecs will work as expected.
>> Unfortunately, I don't have an easy access to HW today, to confirm
>> or disprove
>> this understanding.
>>
> This sounds like an error on the CPU side of the DAI link rather
> than the CODEC side of the DAI link. The formats that will be
> supported on the link are the union of the CPU and CODEC supported
> formats, ie. a format must be supported on both for the DAI to
> support it.


Yes, agree, both sides of the DAI link should provide only endianness 
they support.

This works currently, but, from my understending, it will break, after 
we set `endianness = 1`.

As soon as we start setting `endianness = 1`, the function 
`convert_endianness_formats()` will extend LE to (LE | BE), right?

If so, setting `endianness = 1` is the source of an error, right?


I could be missing something. Let's see what other reviewers think.


> The CPU I2S hardware should be sending out the bits in the same
> order regardless of if the data you feed it is BE or LE, as I2S
> specifies an ordering for the bits.


What does the endianness in the driver configure, then?


> If this is not the case then
> the host I2S controller is claiming to support an endian it does
> not, and the problem should be fixed on that side by removing the
> supported endian.


I think we have a misundersanding of my example.

In my example, i don't mean, that my CPU part of the DAI link is broken.

What i tried to demonstrate - is that if i set the unsupported 
endianness, i wouldn't expect that "the CODEC probably can care about 
the endian", as the message in [PATCH 00/38] suggests. I would expect, 
that i will have no sound.


Best regards,

Kirill

>
> Thanks,
> Charles
