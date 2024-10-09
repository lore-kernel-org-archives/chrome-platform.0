Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3284D1E3787
	for <chrome-platform@lists.linux.dev>; Wed,  9 Oct 2024 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728500459; cv=none; b=mYme8slBVMxW5w+xWfD7LHbZtJsT4b0wpIHeadWic0BsWWS4EWc1FDLPED3W9ISZ8QVBVfxoFid22iap0bzE9aUVQoCGkGbi4VmJZFvV3dVtppHjSmPVJRlaVnZZlkTcjFrKz+WpznTN/fCb62PBRG/kdr0qG/7671/ALZ9gyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728500459; c=relaxed/simple;
	bh=xfVX20iq/fvCNNDymhtyhei4CPO+G7cClG0ZFUmkiMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ea/ZFbFbZiyEo+H9xwpmkpg+HUzggnJzhLhRWwCn3gR2CyZORTmpWnZ9lxykpIFZr8ch98pe048KFr0zm6NM/6K5bvv90rd30aRVCWfTbjYVUWbMlYg8NqQxuNrQVotwkRjtKzoK0uDhCf2ADazRbHyf9oHDoj51g7nk5siZ1iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IX3zgsUI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IX3zgsUI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-431137d12a5so838805e9.1
        for <chrome-platform@lists.linux.dev>; Wed, 09 Oct 2024 12:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728500446; x=1729105246; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5N8/fjlE0efDR6dBiW5OBlDtiY5DqAblDupUGfXzs0I=;
        b=IX3zgsUIPisn00wqM0gwSxbfzCFbtJsTuP04kCs+p4+bovDzdbdtg7Wzt3+vaSztNR
         KDfJaBOT1S/RYqQ18wP42fsneKNmFwB/tZqQnK+w6T5L34OF3jJWSPEtz8InKgIDfVag
         HH+ueo1dMyZZC9VoTnFI/vH8FENw898i0Ob6M+KZ/D9IQK9URwywA583Pp1X3w3rUTvI
         aMJ4ccpWRANYU1UC1rLhfi25wMegCx4+3wfcA39NbGqdl1CSM8ln2vVhCcUb0eBQ97wN
         dio+gYbfCxGeTN/3w2paOOlfuRvDhWSVgxoZ/sShtirlZD2NDC86akez3W6T6ccummwu
         +kuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728500446; x=1729105246;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5N8/fjlE0efDR6dBiW5OBlDtiY5DqAblDupUGfXzs0I=;
        b=NBuEjKELfyDgfbEL0NtCUnh6VjWhGuv4VE3CHFYTPEm+hzj4AXfqzZ5fWIB6M2GduE
         +4jfUvNz4wGQxfGg/JfZx1TK00jaWThMXUcIuKy182fvYCq8LVWj9FoIzIQfvPq9qr8S
         mPhTKHXTyNaf1qrroaBqEGWIx9cLROQU3HnqDUcDUykoyocG++/LWMWv1yuwVpKnbrI8
         /X23uDmVt8pIf3Ney7TCnnaJ0RtZZcvPOIzDz1D0ie8YXXDD0jD4Zy8TnunsmJLXS1Og
         NU1STKDO9rtuR/91SOj2BcSeLcQ2ZBrNvblqlhtEie4mYJ0JSjq5LtitmhC1HuiwU+uQ
         CFPQ==
X-Gm-Message-State: AOJu0YwbyQ2HsCiHvv1+mhY9A7BLXDgcteIKnwUMkPgVXDewKKaiM5p5
	6Oil2tMVpaOUB2HndVUj/ipK4fO7RZkO5xFndYmY1o0czTIZrHTj
X-Google-Smtp-Source: AGHT+IEGCCHp3D/6Dt9OSOkQA2nDN2D7cRs2CWGmw2cTfgoWx0J7ELUF5pZXGr2nQ7WK/SpT/WIvbw==
X-Received: by 2002:a05:6000:b82:b0:371:8f32:557e with SMTP id ffacd0b85a97d-37d3aa8f54amr2418657f8f.39.1728500446339;
        Wed, 09 Oct 2024 12:00:46 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:268e:1448:f66b:a421? (2a02-8389-41cf-e200-268e-1448-f66b-a421.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:268e:1448:f66b:a421])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d443cb76dsm1612731f8f.67.2024.10.09.12.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Oct 2024 12:00:45 -0700 (PDT)
Message-ID: <7767afd2-0ada-4cca-8861-ccdc874d555b@gmail.com>
Date: Wed, 9 Oct 2024 21:00:41 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/chrome: cross_ec_type: fix missing fwnode
 reference decrement
To: Prashant Malani <pmalani@chromium.org>, Benson Leung
 <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241009-cross_ec_typec_fwnode_handle_put-v1-1-f17bdb48d780@gmail.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <20241009-cross_ec_typec_fwnode_handle_put-v1-1-f17bdb48d780@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/10/2024 20:55, Javier Carrasco wrote:
> The device_for_each_child_node() macro requires explicit calls to
> fwnode_handle_put() upon early exits (return, break, goto) to decrement
> the fwnode's refcount, and avoid levaing a node reference behind.
> 
> Add the missing fwnode_handle_put() after the common label for all error
> paths.
> 
> Cc: stable@vger.kernel.org
> Fixes: fdc6b21e2444 ("platform/chrome: Add Type C connector class driver")
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---
> I usually switch to the scoped variant of the macro to fix such issues,
> but given that the fix is relevant for stable kernels, I have provided
> the "classical" approach by adding the missing fwnode_handle_put().
> 
> If switching to the scoped variant is desired, please let me know.
> This driver and cross_typec_switch could be easily converted.
> 
> By the way, I wonder why all error paths are redirected to the same
> label to unregister ports, even before registering them (which seems to
> be harmless because unregistered ports are ignored, but still). With this
> fix, that jump to the label is definitely required, but if the scoped
> variant is used, maybe some simple returns would be enough.
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index c7781aea0b88..f1324466efac 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -409,6 +409,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
>  	return 0;
>  
>  unregister_ports:
> +	fwnode_handle_put(fwnode);
>  	cros_unregister_ports(typec);
>  	return ret;
>  }
> 
> ---
> base-commit: b6270c3bca987530eafc6a15f9d54ecd0033e0e3
> change-id: 20241009-cross_ec_typec_fwnode_handle_put-9f13b4bd467f
> 
> Best regards,

Small typo in the description, should be cross_ec_typec (last c is
missing). I will fix that for v2, but I will wait for feedback and
reviews to this first version.

Best regards,
Javier Carrasco
