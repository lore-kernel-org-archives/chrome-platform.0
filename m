Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA45B379
	for <chrome-platform@lists.linux.dev>; Fri, 12 Jan 2024 00:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="H6nvp6B4"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-6d98ce84e18so4989949b3a.3
        for <chrome-platform@lists.linux.dev>; Thu, 11 Jan 2024 16:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705019926; x=1705624726; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JAK9KBXi33OtAdjiTl1d1gOMeWGfOdW5FgG0yThbQXc=;
        b=H6nvp6B43hxgEpti9NRPYc6OLjHXNfxp6C+5sHc8qz8JarOCOdPLdy8najZsuZXW39
         bIjMfA7km6n5c3Q8+dETE/bA+QqQHK6gCdUQwJe38jUIjl1HUPVFDDaieQAUYpzy7Q4E
         NfSVAP9wGLIdQvl/JqP4g6zGpKVMZLyEQJYkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705019926; x=1705624726;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JAK9KBXi33OtAdjiTl1d1gOMeWGfOdW5FgG0yThbQXc=;
        b=npHuJpCsSak/1VnelBnDlXdoSESuM6zh45T713YtKj2c2h0BqT4wMnIdIxVU+S7Oo+
         EcY2WMF4IvJNIHZqi3d0pU85TcS8lqmPby0s+GrmHrrg6dlCdY0Rhke+jLcyg3N5ztjS
         1eM8zEzylD2rb7BVCvq9u1Fw6PVeY1Pf9EFI8nK5A1jRRPNyr6l+RO/pg4uf4EBSDLsT
         JAMFCMdl3Sgr0gxNy7sWliNSO9AOFhHfsJPeuP+EkjcGulbfhe1XY6/E+FgFTR6zeGDf
         ovo4L6LuJ5eN1MQb7IgDtss7bP8/D9N3bmu/42v7Zbthnmg76UwuZ+RjYxwUJCeMuBC9
         p5RQ==
X-Gm-Message-State: AOJu0YwTU4Bxh4O516vn4KUONzZ/is+Cw3+CJGThzspf/8e1xLagBI8z
	OYoLYnN9jolsv5cHOFLfpnPWPE8aOywe
X-Google-Smtp-Source: AGHT+IFjtpdSOunGRQEO+G9OUyBdAUTnQd+sia/HQzGg2yHiBwnsnkby6j6+R7Pb19wBS6Nz/vpVkQ==
X-Received: by 2002:a05:6a20:2505:b0:199:e425:daab with SMTP id j5-20020a056a20250500b00199e425daabmr194911pzd.6.1705019926122;
        Thu, 11 Jan 2024 16:38:46 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:70e4:ce9:9cc2:b930])
        by smtp.gmail.com with UTF8SMTPSA id l18-20020a637012000000b005c65e82a0cbsm1829393pgc.17.2024.01.11.16.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 16:38:45 -0800 (PST)
Date: Thu, 11 Jan 2024 16:38:44 -0800
From: Brian Norris <briannorris@chromium.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: google: cbmem: Add to module device table
Message-ID: <ZaCKFCMop9lqWzxx@google.com>
References: <20240111151226.842603-1-nfraprado@collabora.com>
 <20240111151226.842603-4-nfraprado@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240111151226.842603-4-nfraprado@collabora.com>

On Thu, Jan 11, 2024 at 12:11:48PM -0300, Nícolas F. R. A. Prado wrote:
> Create an id table and add it to the module device table to allow the
> cbmem driver to be automatically loaded when a matching device is found.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Might as well also patch framebuffer-coreboot.c and
memconsole-coreboot.c while you're at it?

But for this one:

Acked-by: Brian Norris <briannorris@chromium.org>
