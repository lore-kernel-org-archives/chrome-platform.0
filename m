Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C2B8472
	for <chrome-platform@lists.linux.dev>; Mon, 25 May 2026 01:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779673755; cv=none; b=exjEbVLEvxg4rH1DPYbdioXRRYxyTAQXDxGnv7NFVQnmhx1mVDyJ/llX9OMSZ9kNdR3iwt3pHdNb+GlWpzHEsKeb95eir3EvDVX+n8StcDJ6vxs08nBzja+P2jZMAYdDiocay6YUiPGCGft2Ap+pwVnHU3Ojsn2oDK9Yhs8AkBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779673755; c=relaxed/simple;
	bh=cDaGDI3r+xzke3jPoXhYv5x6ipCPebf/2XgP43K54Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6w6nlLSWuCRq6MTSDzOKncGnnR6AiEIBnzlWEgMaaRnvxdsr/TR6YorH97rtbY7qKAKZqkUUI9+U6ynf4T8Q+ocZZAChUQSvppwn7f5fIiyZ4ygg/Q5fpYildeWp0iclLsAh7ZtTQEiwpL6S/Ta98UGlc9g1x+m7YK/idemxjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=MkSzQeCW; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="MkSzQeCW"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7df05fc49e5so9423245a34.3
        for <chrome-platform@lists.linux.dev>; Sun, 24 May 2026 18:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779673753; x=1780278553; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QSxXz0fJUl/u0yNVKSTnYM+nC+klyCfC7mCOal5YHEI=;
        b=MkSzQeCWvH7Xpy/R3HePmMh739IYL7Jr+cPtz5zRpXSn49hrlOeZyJEB/o6UFGa4fA
         x7WG4KI7kI2PURmiDxGIaaTCLt7+Rck8HyT4G38gUH/myQgo9NAPNk8mNht6fXpMIzcE
         9Ki+BAYzPiwKBcpOt5QTIruGxBoAIdv9ZRRIwTIYgQiRXSlgxBmk7MELMTVqPJNC0IXG
         L1MuzPHNtFfklMKpwALod5dT9g3QfVrWPmI7Czi3uoh7aBeOejOWWVh5kP9Pp8IO5elj
         SxuXz2m1UwSaqeExa/R38VtdvOWW3rcjLNc8nvTIpLXDzZTPcLLpgPJWeqFNNt8abLWZ
         +JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779673753; x=1780278553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSxXz0fJUl/u0yNVKSTnYM+nC+klyCfC7mCOal5YHEI=;
        b=aUkCExLjlJr/552HyyaxRN3Cgk7zoZOBVHmjSCbefl4kSMoXRlXjxj4LR+06te1snw
         nWhh7TbC2lI4P8Z3jr7gz9Jimh3dNSWt0Ua76lyqGNOD1e8MiSJtcCe88u+Uu1GxZoxM
         58bq+VdKMjaHOQ0sRzA9GkDAVnJmF3xHkK1f8R+Nwgk9NirkZGfammRVA3aUoLnavbm7
         0BE2KXoXlQ9LtWSqt0EF3b/z4qlP12oTivak6KSpruDjJ4DPKnZxGwWrbkILeyhzdRRC
         AglIO8sA7Rl7+/sIXp4jtPqqMydl+gkvxqyxxpek4wA7IkglueL5ty53pvUlXeCQQIwG
         xwHg==
X-Forwarded-Encrypted: i=1; AFNElJ/cjqfBPuj5I1ZcS7sJ0odkJvVpF8h4PQM5PxQjGrVPEHhkqB2zA8vAu0UP/e6VgYLEPC3c9UuOZu5ltCMvifY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRQn69TZ2eXtQD8MjweA63ujTWC+nn7IIWLkkyGpwBath0qB1m
	fU3G1eiGu55vAPg7LHK0TkRd5UahLs+n+Y5T/xbm/H6wtSsPMIfA8MB3JkaMhD6ZoFM=
X-Gm-Gg: Acq92OFG87o9HRqVMoOqZLDCodT2LuF7H81EjhjGS/nq6oAR0rnplS/GzZCID5YX32u
	5QwEXA7yWyIHjfveB7ScndTNHPsUQOsgIvUOgZQajY/NatZoeuS9h/Gm1FTR/QOECQ7XERbIH9A
	4oRDGfSY9scASIDf74XCUNT7PZtjDcBwpK9ockBLwUuCkOAShYhUp0VVcqzjCphKGPMtlVCnJBF
	gUYPL7jqrN7DvUAYgta574SXn4EchVoqtVq/8mxfPIRqblMi6q2ZxAJ2t4iitt4l4JrwYq5E6Te
	9PQJIFAEBn21d44YV2khGV9IZBMaNf2sHqxuh5GmBdybcLsmg/3sDGdMdGZIozwbUilgSnHn6jp
	EtqfSVIM0wPIPunKjdV5ie1O4PenUHlp2S3LeGCcU+ZoG6RgZ6oDVFGuDk+oP5XIplwFsayNOiG
	j++Sd8GSxL1qZiz4lSE7h6iF9XdplFnuvUA1t5PJaqPPn/GM8FdzoVZEPnNTPB1u/Hwjq0XyydJ
	w==
X-Received: by 2002:a05:6830:6682:b0:7dc:dd58:50a1 with SMTP id 46e09a7af769-7e5fee5ef73mr8197143a34.15.1779673753669;
        Sun, 24 May 2026 18:49:13 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:713b:3006:84c3:c1bb? ([2600:8803:e7e4:500:713b:3006:84c3:c1bb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606459dadsm6267227a34.4.2026.05.24.18.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 18:49:12 -0700 (PDT)
Message-ID: <3c12da03-6c62-4045-b831-e7b07c0ecb5d@baylibre.com>
Date: Sun, 24 May 2026 20:49:11 -0500
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: pressure: cros_ec_baro: simplify timestamp channel
 definition
To: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, chrome-platform@lists.linux.dev,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20260525014654.2399354-1-dlechner@baylibre.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260525014654.2399354-1-dlechner@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/24/26 8:46 PM, David Lechner wrote:
> Use IIO_CHAN_SOFT_TIMESTAMP() to define the timestamp channel instead of
> manually filling in the struct iio_chan_spec fields. This makes the code
> less verbose and mistake-prone.
> 
FYI, there was a server error when doing b4 send, so this last patch
didn't get sent with the rest. I missed the [PATCH v2 9/9] when editing
it manually to send again.

