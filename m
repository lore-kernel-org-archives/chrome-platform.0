Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5771E23C2
	for <chrome-platform@lists.linux.dev>; Tue, 10 May 2022 08:54:38 +0000 (UTC)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24A5TVOj021012;
	Tue, 10 May 2022 03:53:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=nKGRBqzibSjez+vkONFFLwJr7PwxcpIyPYxlptEvWM0=;
 b=J+FbisA9A5Ze1z9aIrpEfHLUTg2gVXj7H7bSN4nrbhkPEBboTmt3Eui6mhY1FcfWo3wg
 0ja8/ZGMBTxBAf6RHoIxDsSdWKDymtUu2voXPGzoF029dQVFZaXPgKdvvgnygoWIQZhs
 EzZM2VuXgaAkLLBopTuUdtrrTTYGBym1gl0nbwUXAVuBK8gd6C4vmfaubAS1Bkrwcozz
 R6C4LwavDOL8wUkzOacujJn6OSpm1G4Wj9Ha213yUycjW+hELkniZ6MRMsTYjvzzAVKh
 v2l2bEhj1d1Uux/LmR373M2GHfgDKffMkq2KPWQQSVz4+cHVAo30bqwsFW8g+ztEs+Iy bA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3fwn6nuthy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 May 2022 03:53:25 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 10 May
 2022 09:53:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Tue, 10 May 2022 09:53:24 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E3A4411D1;
	Tue, 10 May 2022 08:53:23 +0000 (UTC)
Date: Tue, 10 May 2022 08:53:23 +0000
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
Message-ID: <20220510085323.GA38351@ediswmail.ad.cirrus.com>
References: <20220504170905.332415-1-ckeepax@opensource.cirrus.com>
 <20220504170905.332415-2-ckeepax@opensource.cirrus.com>
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
 <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: Ji6ym588hfSzcX_mLm0yOhu-5A0irDxe
X-Proofpoint-GUID: Ji6ym588hfSzcX_mLm0yOhu-5A0irDxe
X-Proofpoint-Spam-Reason: safe

On Mon, May 09, 2022 at 09:22:42PM +0200, Kirill Marinushkin wrote:
> On 5/9/22 10:37 AM, Charles Keepax wrote:
> >On Sun, May 08, 2022 at 10:34:12PM +0200, Kirill Marinushkin wrote:
> >This sounds like an error on the CPU side of the DAI link rather
> >than the CODEC side of the DAI link. The formats that will be
> >supported on the link are the union of the CPU and CODEC supported
> >formats, ie. a format must be supported on both for the DAI to
> >support it.
> 
> Yes, agree, both sides of the DAI link should provide only
> endianness they support.
> 
> This works currently, but, from my understending, it will break,
> after we set `endianness = 1`.

It will break if the CPU side claims it supports endians which it
doesn't which I believe is what you have in your system.

> As soon as we start setting `endianness = 1`, the function
> `convert_endianness_formats()` will extend LE to (LE | BE), right?

Correct.

> If so, setting `endianness = 1` is the source of an error, right?

No, potentially it exposes an error but it is not the source of the
error. Endian should have no meaning once you cross an I2S bus.

> >If this is not the case then
> >the host I2S controller is claiming to support an endian it does
> >not, and the problem should be fixed on that side by removing the
> >supported endian.
> 
> I think we have a misundersanding of my example.
> 
> In my example, i don't mean, that my CPU part of the DAI link is broken.

Why are you sure the CPU part of the DAI link isn't broken? I2S
defines the order bits should be sent out on the bus, this means if
the CPU side recieves big endian or little endian data it doesn't
matter, the actual bus signals should be identical in both cases.
If only one endian works the actual signals on the bus must have
been different depending on which endian you played in which case
the host side doesn't match the I2S specification.

My point is that what you are seeing is exactly what you get if
your CPU DAI claimed to support both big and little endian but
just puts that data directly out on the bus, rather than adapting
to the endian of data it receives.

And to be fair this is exactly what I am trying to tackle with this
series. The fact we have so many CODECs that are incorrectly not
specifying the endianness flag means that it is very easy for the
host side guys to do testing and not realise that the CODEC is the
one limiting the supported endians on the DAI link and thus miss
they have claimed to support endians they don't.

I believe you are right that there is a reasonable chance will see
some breakage after these patches, but that breakage should be
exposing host side bugs which we need to fix anyway.

> What i tried to demonstrate - is that if i set the unsupported
> endianness, i wouldn't expect that "the CODEC probably can care
> about the endian", as the message in [PATCH 00/38] suggests.

That comment in my original post was in respect to CODECs that
recieve/transmit audio directly over a SPI bus rather than a
normal audio bus. The is no standard governing how audio data is
transmitted over the SPI bus, thus endian could be important,
although I need to do some more work to analyse how people are
using these links. Often they are implemented effectively as a
CPU side DAI anyway.

Thanks,
Charles
