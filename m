Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329087B
	for <chrome-platform@lists.linux.dev>; Mon,  9 May 2022 08:38:42 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2496VW3e001166;
	Mon, 9 May 2022 03:37:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=36HXijmydYE4zY1or9WwEGwBGzA/Xuz1kNxpjRTbtcQ=;
 b=Cklqhy702Q0ZFNrwkaxYr5GIHrrmUl8XzgHm+DRCZunh30jsRdGYCtMnEjzWbOqGef04
 qpBdZy+nm89bNuZSiORPXjUGbtxDsdzEqLCPmoUxveGjGgo4fh3oFxJUjDMRjBhARh6U
 xUMragOqFRtnl2qUlwlphzpc9/3HJPv7E5e0Uie6w/xC+9gc/qEHr1BA5oBIfM+gSVNW
 znPvtO9URWfc06ONWxIF3EOfY1W0LNheQ50avR/tM00WW5wSgS0jyOOtPjzK2WruZOL+
 9jkYy16mqSW4derTugfO19YuGERAf+VjGozwKimHt0ivEY9Kqcy1QvXlHMTHJcVgk7oM rQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6ntddq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 09 May 2022 03:37:30 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 09:37:29 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Mon, 9 May 2022 09:37:29 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1C9F0B10;
	Mon,  9 May 2022 08:37:29 +0000 (UTC)
Date: Mon, 9 May 2022 08:37:29 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kirill Marinushkin <kmarinushkin@birdec.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <codrin.ciubotariu@microchip.com>, <lars@metafoo.de>,
        <cychiang@chromium.org>, <tzungbi@google.com>, <bleung@chromium.org>,
        <matthias.bgg@gmail.com>, <oder_chiou@realtek.com>,
        <steven.eckhoff.opensource@gmail.com>,
        <srinivas.kandagatla@linaro.org>, <alexandre.belloni@bootlin.com>,
        <kuninori.morimoto.gx@renesas.com>, <jiaxin.yu@mediatek.com>,
        <alsa-devel@alsa-project.org>, <chrome-platform@lists.linux.dev>,
        <linux-mediatek@lists.infradead.org>, <patches@opensource.cirrus.com>
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the
 endianness flag
Message-ID: <20220509083729.GX38351@ediswmail.ad.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: t50DEXpTLvmQxPAQqhw5qQCpY1C6gaNp
X-Proofpoint-GUID: t50DEXpTLvmQxPAQqhw5qQCpY1C6gaNp
X-Proofpoint-Spam-Reason: safe

On Sun, May 08, 2022 at 10:34:12PM +0200, Kirill Marinushkin wrote:
> In the [PATCH 00/38] of this patch set, you write:
> > 2) Devices behind non-audio buses, SPI just moves bits and doesn't
> > really define an endian for audio data on the bus. Thus it seems the
> > CODEC probably can care about the endian. The only devices that fall
> > into this group (mostly for AoV) are: rt5514-spi.c, rt5677-spi.c,
> > cros_ec_codec.c (only the AoV).
> 
> From my experience with some PCM codecs by TI, they can not care about the
> endianness. For example, in driver [1], if I allow BE format as
> well, and configure
> the sound card to use BE, it will not work. I have no sound with BE.
> In these cases, the codec HW supports *only* LE. That's why their
> `snd_soc_dai_driver`
> structures provide only LE in the `format` field.
> If such drivers specify `endianness = 1`, then `soc-core` will
> extend their supported
> formats with BE counter-parts, see [2]. AFAIU, it will have the same
> effect, as if the
> drivers themselves provided their formats in both LE | BE.
> 
> I don't think adding `endianness = 1` to such codecs will work as expected.
> Unfortunately, I don't have an easy access to HW today, to confirm
> or disprove
> this understanding.
> 

This sounds like an error on the CPU side of the DAI link rather
than the CODEC side of the DAI link. The formats that will be
supported on the link are the union of the CPU and CODEC supported
formats, ie. a format must be supported on both for the DAI to
support it.

The CPU I2S hardware should be sending out the bits in the same
order regardless of if the data you feed it is BE or LE, as I2S
specifies an ordering for the bits. If this is not the case then
the host I2S controller is claiming to support an endian it does
not, and the problem should be fixed on that side by removing the
supported endian.

Thanks,
Charles
