Received: from msa.smtpout.orange.fr (out-71.smtpout.orange.fr [193.252.22.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC09C166F06
	for <chrome-platform@lists.linux.dev>; Wed, 21 Aug 2024 10:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724237029; cv=none; b=sZLYolk1fYZ/vJPhfhWe4YKAwH+0ly/gFWG92VaYe0AlWQpRCcNkV20QJbbkppPDyVpvRgqvELbQGi/arTt8C4jgHfHNRPUjPlr3tUk+T2iWGURKdlr4AA6lKys8Zj2zMz8jtkCv6ehGOAmRsGzhMdk37LnDAk4+FBdLOP3KRGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724237029; c=relaxed/simple;
	bh=2YlTy32Jggt+3QyeP21/kjK+y7Jl+8flQ/6jnHAh+CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pSA2qBOwJY/4KPZaGMZwUewDJPYFR4jhk/e3t847fnHsik4/W0vgsmZ7KumzCCvS5siBuKW52HW6QiMJ6oVimkJM2vUf2pWOaReXIgLa4rdmygwZ6uG5vpN3uFrIM2YCV/cwC29aIZDH5weP5w5fg4OMio0X71PJ/9gBHg0F8fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=QRlDTPMv; arc=none smtp.client-ip=193.252.22.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="QRlDTPMv"
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id gioZsFShGLYfJgioZsOmo1; Wed, 21 Aug 2024 12:43:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1724237024;
	bh=l6ojaAh4MgmsY8RQ0iWUL80jY5qZrzUj8fi6obn1K9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=QRlDTPMv7xFGLMAFrhiGmHS7PQkCU9iNI2r9aY4MzWzejb0lClaM2HsQE4gWKD43D
	 Q3RuzZu02IBPXlbDtWjY5LJfm7AjbiFwfERmF4tJilnYEA8sxCpRWe7OxR0JrGkU0C
	 Ve9NWlh1g/3x7OGCMxIdevi+q7wE8FFiyUe7X9n1YBwdWsvy7/aEVs35xPqis0ZS1I
	 ipy4TlzHx4fzOG70izQ2idWGQbUnJlYNQG4rzRddwjfkWarIy62q+ObVEalPuqj/VQ
	 PCXxFCSm0aIeJrWuHBBkiYKi4cXQTzgp0/srKJwjnwP5UbKTv8C9l3Qfnbr0TUXkmr
	 3KFkA0S7pw2uQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 21 Aug 2024 12:43:44 +0200
X-ME-IP: 90.11.132.44
Message-ID: <43c93550-941a-4a8b-9734-f7a9877ddf4d@wanadoo.fr>
Date: Wed, 21 Aug 2024 12:43:43 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] platform/chrome: chromeos_laptop: Use kmemdup_array
 instead of kmemdup for multiple allocation
To: Yu Jiaoliang <yujiaoliang@vivo.com>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
References: <20240821084104.21095-1-yujiaoliang@vivo.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20240821084104.21095-1-yujiaoliang@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/08/2024 à 10:41, Yu Jiaoliang a écrit :
> Let the kememdup_array() take care about multiplication and possible
> overflows.
> 
> Signed-off-by: Yu Jiaoliang <yujiaoliang@vivo.com>
> ---
>   drivers/platform/chrome/chromeos_laptop.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/chrome/chromeos_laptop.c b/drivers/platform/chrome/chromeos_laptop.c
> index a2cdbfbaeae6..7bedd82dd3a5 100644
> --- a/drivers/platform/chrome/chromeos_laptop.c
> +++ b/drivers/platform/chrome/chromeos_laptop.c
> @@ -749,10 +749,9 @@ chromeos_laptop_prepare_i2c_peripherals(struct chromeos_laptop *cros_laptop,
>   	if (!src->num_i2c_peripherals)
>   		return 0;
>   
> -	i2c_peripherals = kmemdup(src->i2c_peripherals,
> -					      src->num_i2c_peripherals *
> -					  sizeof(*src->i2c_peripherals),
> -					  GFP_KERNEL);
> +	i2c_peripherals =
> +		kmemdup_array(src->i2c_peripherals, src->num_i2c_peripherals,
> +			      sizeof(*src->i2c_peripherals), GFP_KERNEL);
>   	if (!i2c_peripherals)
>   		return -ENOMEM;
>   

Nitpick: sizeof(*i2c_peripherals) would also work and is slightly less 
verbose.

CJ
