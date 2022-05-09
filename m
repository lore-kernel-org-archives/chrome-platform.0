Received: from server.euro-space.net (server.euro-space.net [87.117.250.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07327B
	for <chrome-platform@lists.linux.dev>; Mon,  9 May 2022 20:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=birdec.com;
	s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
	Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=0thvfekGh/aAfoqpfXfRl6nxAhfStkK7Jhn3mf6RiEA=; b=Rij2gJXFQJ0arW09MifiJBmL5Y
	+A7iJNA+2hIEQcedcGTH5vZ3kkBGe24or8LvW7u27rcbE88CS1WDaQ3Pnby7a6x6qpcms7+wFy5dx
	uxi+AuMje5WZFIX8SDYTtPdeZTU36aEC8TMIE5xKcHKn7EhCEw7WEaAzMjD0dRkiv8s8drxTh6Mtf
	BKlg9ECiIAAyyNcJNw/8sOu/fW4XKc/2i7p+XQ7ohOK5wyPwtuI9zAzA7OgHQmkY2NIOG/Cupf1v3
	LnxLMomqdjhh/zMwQ+lAKRGvdcU8hWSibOznVyRs+1wcQQ4bxP9tdLkH9tBJN/CpkH4PxCToWnVKp
	XLEA4sYA==;
Received: from dynamic-176-002-223-001.176.2.pool.telefonica.de ([176.2.223.1]:17244 helo=localhost.localdomain)
	by server.euro-space.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <kmarinushkin@birdec.com>)
	id 1no9il-00073V-DL;
	Mon, 09 May 2022 21:11:08 +0100
Subject: Re: [PATCH 01/38] ASoC: soc-component: Add comment for the endianness
 flag
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
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
 <ec86bdc6-b3c4-e595-02c8-e0687c442fd3@birdec.com>
 <20220509083729.GX38351@ediswmail.ad.cirrus.com>
 <901cb995-4a82-741e-00ea-a1c0b22ae749@birdec.com>
 <Ynlryv8fgKiHYXUt@sirena.org.uk>
From: Kirill Marinushkin <kmarinushkin@birdec.com>
Message-ID: <8db9f890-1513-d9ed-58e3-5b402468288e@birdec.com>
Date: Mon, 9 May 2022 22:11:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Ynlryv8fgKiHYXUt@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
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

Hello Charles, Mark,

Thank you for the clarification!

Without such a deep understanding of ASoC, as you have, I see a risk in 
a bulk enable of `endianness = 1`, the way we do in this patch set.

Here, we enable an extra feature. Worst case, if some codec doesn't 
support the feature, we will have a system, which thinks that it's 
supported, but in reality, it doesn't work. And we will not even have a 
error message, because the driver advertises the feature as supported.

Maybe my carefulness is not applicable here. I see that i don't have 
enough expertise in `endianness = 1`, to participate in making the 
decision here. But at least i want to ensure, that we all understand the 
risk.

Best Regards,

Kirill

On 5/9/22 9:30 PM, Mark Brown wrote:
> On Mon, May 09, 2022 at 09:22:42PM +0200, Kirill Marinushkin wrote:
>> On 5/9/22 10:37 AM, Charles Keepax wrote:
>>> This sounds like an error on the CPU side of the DAI link rather
>>> than the CODEC side of the DAI link. The formats that will be
>>> supported on the link are the union of the CPU and CODEC supported
>>> formats, ie. a format must be supported on both for the DAI to
>>> support it.
>> Yes, agree, both sides of the DAI link should provide only endianness they
>> support.
>> This works currently, but, from my understending, it will break, after we
>> set `endianness = 1`.
>> As soon as we start setting `endianness = 1`, the function
>> `convert_endianness_formats()` will extend LE to (LE | BE), right?
>> If so, setting `endianness = 1` is the source of an error, right?
> If doing this for the CODEC side of the link causes an issue it's just
> exposing an existing bug on the CPU side of the link which may already
> be affecting other systems - like Charles says the CODEC is expecting a
> fixed bit order regardless of the memory layout of the data.
>
>>> The CPU I2S hardware should be sending out the bits in the same
>>> order regardless of if the data you feed it is BE or LE, as I2S
>>> specifies an ordering for the bits.
>> What does the endianness in the driver configure, then?
> On the CODEC driver side it is meaningless.  On the CPU side it controls
> the in memory layout of the data.
>
>>> If this is not the case then
>>> the host I2S controller is claiming to support an endian it does
>>> not, and the problem should be fixed on that side by removing the
>>> supported endian.
>> I think we have a misundersanding of my example.
>> In my example, i don't mean, that my CPU part of the DAI link is broken.
>> What i tried to demonstrate - is that if i set the unsupported endianness, i
>> wouldn't expect that "the CODEC probably can care about the endian", as the
>> message in [PATCH 00/38] suggests. I would expect, that i will have no
>> sound.
> If the CPU side of the link is fine then there should be no problem, we
> simply start supporting both endian settings all the way through the
> chain, if userspace chooses something that wasn't supported before then
> the CPU side driver will look at what's being configured and set up the
> hardware appropriately.
