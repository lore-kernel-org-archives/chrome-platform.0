Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76BD2D24AE
	for <chrome-platform@lists.linux.dev>; Fri, 29 Aug 2025 11:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756466944; cv=none; b=r8u22hL81DXYsre9m3JuXD2rdVYpaDccsT/EeMMJcOFPGjw9hcoiJfp+JnCHNI5pibrgpSjnfjmJIntC78ZaP1gjgEHIy1t5ndcqz8hABDys5xxNfbfc36XWmcP/VpKgez33Q7pVrMqOxmqzGatgOvaUHcyC3KTjEpEHtb9SESA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756466944; c=relaxed/simple;
	bh=i+imFVcKQoTRvA94JW8BwscPfzjUHIJPFezkYRwAAUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZHjvjb1ZiO8Bvu9ph1Mtx2jeUTdRjpd4oMjVM3aAdQQ/K2xFHVe73ZfM2O3dkBSU8OCMahCpaxaoIzk6Y1GbGJC/oUCY6hXCBoj1yE5uS8lLh2yIXDkG6cSuKKWzw2KVLHtjPFNobIUukEhrXYYEVzduHeHWfcDiZURy3UbA7rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEUKSYlH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEUKSYlH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45a1b0c52f3so11782385e9.3
        for <chrome-platform@lists.linux.dev>; Fri, 29 Aug 2025 04:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756466941; x=1757071741; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IECroD+5xRBd7kOVpD/heIMCG2GWKaw/GtnaUMuAQGg=;
        b=TEUKSYlH5Se1EngTFWa82ol+QMW9ih1NYLKQOG7Cl9/yTL3KavbQ+qHxtTwZShLpFE
         B8iLaKiiVIhGIJ2glLtr6+qf1jugxukqv1wUHB0YOGPIbCM07WqbGfCSS64tEPUmp0Qa
         jllZMYOCeHR6+hFwhAfhLqgJijPs2tfAwQliJ00ETjT1rbVE+dcCKK+PJ+L6McCqzJtc
         slSxQi3RWPutfTl2e3FaFs4VNnybvvbtkLtyL8lkLyea179yTVdY7hJvWNjA+ISBlQ/j
         qsBR1er5RLblsHbSwpNccFVlSjHmQoTLoU7UB1bA+VkPrEe5DGCV9+r1KpGlKbJz5ZD/
         zi0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756466941; x=1757071741;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IECroD+5xRBd7kOVpD/heIMCG2GWKaw/GtnaUMuAQGg=;
        b=ZxC77goPB6kc0qigX51ezsTr8sAD4289KQG52Lt9YB3h/SrDPw8zcRYpIkEF+3W4iV
         wNpk0eIV7qQmuWrV2qnh1OFlMn3hg5faBlMPADjfgF/NqygVHkm2a2MxT5PdcxKJWwk5
         CGrCYK8cGiuyRIa75qKmd/c7cxE+Sk+FgGSfyKst+FiICQJvT0VdWHx8OaZTasWdRCsT
         v/natip7H2m/BpUHZ0wNpKjv20HK3hMDZKXA9ob3Q26ZoP3t9xld69S2al3lHfD4682d
         48DW/n7Elb04EcWaV8bPTTjgbvb1mRbx03vLqV67C+pW23LKqWtoxU1gnjoHQnaUWbVx
         6O4w==
X-Forwarded-Encrypted: i=1; AJvYcCXw7Md3wbhDNG55jETlSfUA3n+pAKwG96odZRLYFle4Jky9HgaKrCEObKzSJyjp6TN6hv4qleAhQuzhEyRwS4g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKrv61MQLByl++Tt0ffcUWjP6Rd5JtM4h6sQhzbE5Z9Rk+bqpo
	Ub041/3CrODrBUPd6bnHXRs2myc/jlmuXU0I65Ut7kJNLJ0U2tPAHwO8
X-Gm-Gg: ASbGnctQ/5JKG05h/QhQzNd/r4iuypK8lUrAE4nrXn5sJ5Q585E8mpl469igHsTwkau
	2kx7ZDJXftvtxxEvvt4LQwlYoyOUcLd+enc/eHB4jdNNpU385I09vgq/1jLpcvyeNK9SPVMuOkL
	wJwWTJBrkRe/adTOI9IxsCwnmnckGts5fiQLOVWmoBm0kVKk5vFB0+0f2ujt/cX+XaDf5Lguy5J
	Ffo2z1/MsIkYz0INqe2CGSKXEsufihXapnJnrBwWmkcUF8MMRw0uSI54AvwUkNMXz0eX8UUuj2t
	qMTu8UUVJwUUOak+iqzUWgRhLFFBxf4kX4sqjzsGD5t1bBtrPlVRgiQT4ECZDTmVzYaPlvi3Opb
	0gMdwjcq4pxKDtTA7TovQ3psFKKl1yOMXnvNiYXC3sekqfsPU+K3akfll
X-Google-Smtp-Source: AGHT+IH7WrEizvpVr5WdiWE4chzzJhxdmZ89DQpCDiCqgUKg5HgaNojfO1SAIwyFEC6teL6gWWKCdQ==
X-Received: by 2002:a05:600c:3b15:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b517d4580mr259667095e9.30.1756466940997;
        Fri, 29 Aug 2025 04:29:00 -0700 (PDT)
Received: from google.com (brn-rj-tbond06.sa.cz. [185.94.55.135])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3cf276d5e5fsm3098209f8f.27.2025.08.29.04.28.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 04:29:00 -0700 (PDT)
Date: Fri, 29 Aug 2025 11:28:55 +0000
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 0/5] platform/chrome: Fix a race when probing drivers
Message-ID: <sqgfgwmbpxvaszyxt4mymne6dvhzjvuifogsqjdu6j3tm436ph@x7chldp3dfpr>
References: <20250828083601.856083-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828083601.856083-1-tzungbi@kernel.org>

Hi Tzung-Bi,

On Thu, Aug 28, 2025 at 08:35:56AM +0000, Tzung-Bi Shih wrote:
> A race is observed when cros_ec_lpc and cros-ec-keyb are all built as
> modules.  cros_ec_lpc is cros-ec-keyb's parent.  However, they can be
> probed at the same time.
> 
> Example:
> 
> + -----------------------------------------------------------------+
> | Some init process (e.g. udevd) | deferred_probe_work_func worker |
> + -----------------------------------------------------------------+
> | Probe cros-ec-keyb.            |                                 |
> | - Decide to defer[1].          |                                 |
> |                                | A device bound to a driver[2].  |
> | Probe cros_ec_lpc.             |                                 |
> | - Init the struct[3].          |                                 |
> |                                | Retry cros-ec-keyb from the     |
> |                                | deferred list[4].               |
> |                                | - Won't defer again as [3].     |
> |                                | - Access uninitialized data in  |
> |                                |   the struct.                   |
> | - Register the device.         |                                 |
> + -----------------------------------------------------------------+
> 
> [1] https://elixir.bootlin.com/linux/v6.16/source/drivers/input/keyboard/cros_ec_keyb.c#L707
> [2] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L405
> [3] https://elixir.bootlin.com/linux/v6.16/source/drivers/platform/chrome/cros_ec_lpc.c#L644
> [4] https://elixir.bootlin.com/linux/v6.16/source/drivers/base/dd.c#L418
> 
> Note that the device link[5] can't help as in the observed environment,
> the devices are already added via device_add()[6].
> 
> [5] https://www.kernel.org/doc/html/latest/driver-api/device_link.html#usage
> [6] https://elixir.bootlin.com/linux/v6.16/source/drivers/acpi/acpi_platform.c#L177
> 
> The series fixes the issue by ensuring the struct is ready for accessing
> before continuing to probe cros-ec-keyb.

Why is the keyboard platform device instantiated before the transport
(cros_ec_lpc) is done initializing? I think this is the root of the
issue...

Thanks.

-- 
Dmitry
