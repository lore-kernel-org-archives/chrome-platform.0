Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C24E1D0
	for <chrome-platform@lists.linux.dev>; Tue, 23 Jan 2024 22:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706047671; cv=none; b=RjGz8+efHo8qMHpJRPJ1HyXn16dpLIDSUTh0K+rRgnN5dTL6++uNtcY9f4QOOOdwaDh+X5q9I2sNrQ6mpiC+V65I++XM+vjSvqzUO4pX+3TQ9SFKaFLNuQD3Ar6zEUX9LhTQqsBiL4eI+NOiO0jW33fNqvUFzEKDlM/YVfhusbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706047671; c=relaxed/simple;
	bh=cQsmHFZVWyInCHAn5Rn6vdAZZg0p7mPVL/S96zJH1os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDZDzJg8Ch0duDM+xCTpQE4ILysAeHZPaO60GG2jzzVGUN5LNmlqMDZRy2edmBwvUF+E8Ht0zVhP6noC9LgE+NnkCZ6ttv3pY1fBe13QswUAAKMcyhvFWGsbBD8F+4edIFt5LlSys8pbfMKgcIQv6A310NJ4xiMPUDCVQvQ7Czw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PALBlqjK; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PALBlqjK"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-58e256505f7so2427068eaf.3
        for <chrome-platform@lists.linux.dev>; Tue, 23 Jan 2024 14:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706047669; x=1706652469; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8pjbL2bDroOgNYlLsF17lwitb94Mh3o4FZHdBe9FHQ=;
        b=PALBlqjKztRU3/HTY0qQ6nI9BWF+2UpYj1sz5v0VEFaTWai1HpnpAtZS7702mfPfeu
         6kSfGNXFwKtsGtHr50Q5Muf6W1P+LhA9vSBAVvuxn2tzSvZ6X2bEOxSjxsIMSwC0USiD
         Jl6eHzqn5h5M9qryVe86N9XpVxF6Kj4XwgBa0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706047669; x=1706652469;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8pjbL2bDroOgNYlLsF17lwitb94Mh3o4FZHdBe9FHQ=;
        b=QH2SximS8Z3/msVvtHSx295IY+DJvaiLkSttppRBPKEdH5upuOjCKf2KWmxFEq/NtN
         Iaqz+abiil9t0OFy6EiDhkoBEJueaunfHb9ohHV4gv9aX4vOU9jOglbXBMcbEt4OLIHB
         +oY/DHL9KuzBR9n9IpTprfThP2uGlEwpdu1zy3N4oHVKjwaZZXWTfsSsXc3Xiws858GI
         rNlC34p8ayUIhvnv1CXl2xopHLxkQjawdgrTd1pe2MHsaKNz6vxigbS6bryh/RQPSTAL
         XpWJwr4MkNyXRMtwsiNwfgoVB7ItsNBwr9w7uEWDQ9307CIU236/lO/UNxPxjS2lcC+C
         ph/A==
X-Gm-Message-State: AOJu0YzoZ1VF/H+F3orG1KWuG/MXMNbGtymnWP7fnc2AZvVyLFrsr1k2
	yIUnVU18CkyB8Gd90BiwiH8FtbsT8IpDHPMhdgM7V2dLYXGOETR5ZCrFzPETIg==
X-Google-Smtp-Source: AGHT+IFWoD+lnHXIttBjzZpwoHm2cRiXjARLx7hiQl/YiDKkh3Ptob0qZx9MDjtL1L/zXzjZLUMhUQ==
X-Received: by 2002:a05:6358:4403:b0:176:4f31:75de with SMTP id z3-20020a056358440300b001764f3175demr3422258rwc.6.1706047668782;
        Tue, 23 Jan 2024 14:07:48 -0800 (PST)
Received: from localhost ([2620:15c:9d:2:81da:d4e1:ee51:c4d6])
        by smtp.gmail.com with UTF8SMTPSA id t8-20020a63dd08000000b005cf450e91d2sm10500903pgg.52.2024.01.23.14.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jan 2024 14:07:48 -0800 (PST)
Date: Tue, 23 Jan 2024 14:07:47 -0800
From: Brian Norris <briannorris@chromium.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Julius Werner <jwerner@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	kernel@collabora.com, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/4] Allow coreboot modules to autoload and enable
 cbmem in the arm64 defconfig
Message-ID: <ZbA4s-gg4o5o7ypM@google.com>
References: <20240117-coreboot-mod-defconfig-v3-0-049565a27bba@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240117-coreboot-mod-defconfig-v3-0-049565a27bba@collabora.com>

On Wed, Jan 17, 2024 at 04:03:21PM -0300, Nícolas F. R. A. Prado wrote:
> This series adds the missing pieces to the coreboot bus and the module
> alias generation to allow coreboot modules to be automatically loaded
> when matching devices are detected.
> 
> The configs for cbmem coreboot entries are then enabled in the arm64
> defconfig, as modules, to allow reading logs from coreboot on arm64
> Chromebooks, which is useful for debugging the boot process.
> 
> Changes in v3:
> - Merged all "add to module device table" commits into a single commit
>   which also changes the coreboot_driver struct to contain an id table
>   and avoid unused variable warnings for the id tables.
> 
> Changes in v2:
> - Added commits for vpd, memconsole and framebuffer drivers to add them
>   to the module device table

For the series:

Reviewed-by: Brian Norris <briannorris@chromium.org>

Thanks!
