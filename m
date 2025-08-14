Received: from omta38.uswest2.a.cloudfilter.net (omta38.uswest2.a.cloudfilter.net [35.89.44.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904DA28724D
	for <chrome-platform@lists.linux.dev>; Thu, 14 Aug 2025 11:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755172118; cv=none; b=cT90Faa8q21WJWlRT73clwnxcdfPf5zgaH5ysbTB9DncXkdz9y0gz0KctK82aFIYfUWDMnBTMOOySx8TvrN/yhK8e4+jw3wBs0tUAnAKqoUt8WhGslX4tgawnBXyedgNqDkfBLfRXBHqsqXk90vRWm9LkCs1rnkNTldZ8S+Tw9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755172118; c=relaxed/simple;
	bh=2n58AnN8/7Sa58+iL/4wUwjaX1O7651vgF/GnzLpYUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6mJpTllcaH1O52B7p1c+e0eRF3xwAe0JmRCVT+N1tX5Qz05ptLGdddEqIPHd5yvCpmVbmExKawUmAP89Y4AwPrUgdD8lKviPZdmvMSckMBaNq2cklpvUk0LdUOcdrPkydrGq+m7tg8jpPujAafykEZkXKctvhaILCRoVGYDZus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=tPyjpAX3; arc=none smtp.client-ip=35.89.44.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="tPyjpAX3"
Received: from eig-obgw-6005b.ext.cloudfilter.net ([10.0.30.162])
	by cmsmtp with ESMTPS
	id mTtsub312uKaFmWRfusNrq; Thu, 14 Aug 2025 11:48:35 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id mWRdukpfrgahDmWRdu9VCf; Thu, 14 Aug 2025 11:48:34 +0000
X-Authority-Analysis: v=2.4 cv=faKty1QF c=1 sm=1 tr=0 ts=689dcd12
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=aBvOdYTnlRd+2LFm/58ENA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=7T7KSl7uo7wA:10
 a=ciplz7lBqJibEU-u5rUA:9 a=QEXdDO2ut3YA:10 a=xYX6OU9JNrHFPr8prv8u:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EbnZD1AMDuV7+S1NXEbn+nHpy6nqMny8DiTNPxWn18g=; b=tPyjpAX3i3y4qgRzjjAKYzgBHO
	BGB2PaBSXDsfBXm8ZgZX9ICuWBjt1GJa49v0Ki3hMeIyWkZtbZgGxvMrYPPL1+3RpkimVlKoY9dEn
	YtBOR85SwXYIRHc5Av4JcZFKvEf1nfV4qQERyhanJEHvMPKymsW0yIjHwpDfNg1QHwAWjnZxLPWF3
	3mOj1/FKN3icVdXdoMlW9fvXT7Wby/9RI5jHirWT3SW/Pp0FIb0r38tNEzJL09LwLLNC7CbkgEwYd
	oFAIWxRRXfg39FV2aECAF5jnXDK3+r+Rbjv6lIjGXMbvvam6jLa4sXd08yNXPDB4gzoUMZhR/q4+t
	UNPgkVDg==;
Received: from 172.117.7.202.megaegg.ne.jp ([202.7.117.172]:55560 helo=[192.168.241.228])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1umWRd-00000003h2r-0Aaz;
	Thu, 14 Aug 2025 06:48:33 -0500
Message-ID: <4b9eea66-f004-4b5f-bf48-4c32205cc8ee@embeddedor.com>
Date: Thu, 14 Aug 2025 20:48:23 +0900
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] pwm: cros-ec: Avoid -Wflex-array-member-not-at-end
 warnings
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-pwm@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <aJtRPZpc-Lv-C6zD@kspp>
 <2pgdxifg2zmyhvemm7a2qntprsz5nhh3ustrrlg2vvcqffwj6c@22enjpgycjbt>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <2pgdxifg2zmyhvemm7a2qntprsz5nhh3ustrrlg2vvcqffwj6c@22enjpgycjbt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 202.7.117.172
X-Source-L: No
X-Exim-ID: 1umWRd-00000003h2r-0Aaz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 172.117.7.202.megaegg.ne.jp ([192.168.241.228]) [202.7.117.172]:55560
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 3
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfAo9LcUR3Gydsr15KmIZSuS7mMUJZjbk6tqgAAImb2j26fX54HzMJxESMoQjoVz/VvDEabMZlPuNZlwC8KsyPKYNVuTc8bdN+xtRIAX8il8OhQbm44kl
 Qk/Li72vU5hZab6LSswSRdy4kqvN5v9a9R+rX2SKBSG2U9raqZ98oFbZI0MJFGOJ8+YSxT7o9V5OMVqPzSQlMaWoDEUSidddeJis51epHN6Iw8LNWoqKRp8o


> diff --git a/include/linux/stddef.h b/include/linux/stddef.h
> index dab49e2ec8c0..8ca9df87a523 100644
> --- a/include/linux/stddef.h
> +++ b/include/linux/stddef.h
> @@ -108,7 +108,7 @@ enum {
>   	union {									\
>   		TYPE NAME;							\
>   		struct {							\
> -			unsigned char __offset_to_##FAM[offsetof(TYPE, FAM)];	\
> +			unsigned char __offset_to_##FAM[sizeof(TYPE)];		\
>   			MEMBERS							\
>   		};								\
>   	}
> 
> which only leaves one usage of FAM in the name of the padding struct
> member. I'm sure someone is able to come up with something nice here to
> get rid of FAM completely or point out what I'm missing.

Flexible structures (structs that contain a FAM) may have trailing padding.
Under that scenario sizeof(TYPE) causes the overlay between FAM and MEMBERS
to be misaligned.

On the other hand, offsetof(TYPE, FAM) precisely positions the trailing
MEMBERS where the FAM begins, which is correct and safe.

Thanks
-Gustavo


