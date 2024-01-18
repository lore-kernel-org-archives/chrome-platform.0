Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABA02D62B
	for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 17:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705600543; cv=none; b=povJNUP78Xq5zDbPhHX/hH483RZGLfCrT26LEz7pV6cKHjYPuypwfA/wgYQNGnB0lfCpM8p2/qhpT65upeZPN3gpMQu474W1QNC79rGdmziYD/FdR3juM9ObI0MTyVRsDTacGCYweCpY4Y5FoEG1YEUpMjti2lCe8x/XUVhn5gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705600543; c=relaxed/simple;
	bh=fKFKhXygl42NeFOdSVuJarNs+0BLW2bOFf769RHcpgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=keOZVvfPZWgySMnEQgzaCQHaN9HVDLmkywNaCQVZSX5UGZM/lbq6tv8A8mahPDgE3fA4loHjmy4j+dmivBuqZSJLhmS0PqQts9RV5L9OpObYnb+2C2Dd0Sm2GgFkC5G6Cg1UwT4dBca0yyue9T+tSfb75NvsSXzxpY07RY/W2ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lcBrP6Ue; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lcBrP6Ue"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6d9bee259c5so7569290b3a.1
        for <chrome-platform@lists.linux.dev>; Thu, 18 Jan 2024 09:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705600542; x=1706205342; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HQV2inHhk6YnIPGUCD6FRidR+XFSr3X65Rn9aWPTRfs=;
        b=lcBrP6UeduoVg/pZnfK0fs3zM6E7fl1oJGHtCK4Bew2VN6EKcGngb37HmficKnGeiq
         QPIkPDP3E7fwj7TjBhW3Y9RGtKJUm6EXzxjxl/2a3NSihqU6gwcF0uaeHJbQ9ZwZKB8F
         btmgRhIo8IP7/Csdp0MEFZa8J58mbPfLLBtq1wqvXjSHX2D75qqcw0VA0MXJQEuKNgCI
         gZ/PDeuufiONfj2CrR3nPd2XtmGeaLAluL0+IXRiX0F1fNpfVyZyh86JhssqjNYm4A4s
         UTo7ofdrsoKzxcgxv5dz9q3RtKaNDOyJEWMMco302nPh5RUfI5YSKTSLlELX4bji2TZh
         iIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705600542; x=1706205342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQV2inHhk6YnIPGUCD6FRidR+XFSr3X65Rn9aWPTRfs=;
        b=ee4peQy86S4JeLwJVoOzi87x+v+UN6VjwYdSi3DzT8+Fxiy2U+MrC1GXozsEohVUXB
         y8vWEw725u7sY0KDTQawqitK6FwRxeIcBQH+hclfLUBuQhnVwAiSbKkGvknmG+LUQ4zU
         0DfbrHJx8hwZFkfKofxTqFMsa8JPYsPFCH7XWthKbIH0b3pJUkV81KIkw8PlQOqFNKzV
         xe+9InMcuvDG6TCFS33JAhUc54MuW29RHyClMT9a3ruwyawVOpxMoiGmXj3rW93xj9r1
         M+aPSlAReJR2JNPSn45B201mdPzTW5lBh7Hho/qtwoM48Xf2ZH+3kOHRxMcFBU2nWjzy
         c+Gg==
X-Gm-Message-State: AOJu0YzK+zdIaRVC/JyHn/9ewq/JMHUZj7MRrXR9e7Stq63dypE89+FU
	2nucic4rEGDxzwGegM1F0VTmFUhzG5eIu222zqaLkh/RHic46G8A
X-Google-Smtp-Source: AGHT+IELdrhwgZSXqBrT051wdOSKlOlhfFGsJhxKGC6nUuSXcUvarjBz1SucjIUHsxFlNa1NFmzVgw==
X-Received: by 2002:a05:6a00:1791:b0:6d9:9afd:82f9 with SMTP id s17-20020a056a00179100b006d99afd82f9mr1271350pfg.51.1705600541769;
        Thu, 18 Jan 2024 09:55:41 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:f04f:73f4:b79:a70c])
        by smtp.gmail.com with ESMTPSA id fj2-20020a056a003a0200b006d98505dacasm3587634pfb.132.2024.01.18.09.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 09:55:41 -0800 (PST)
Date: Thu, 18 Jan 2024 09:55:38 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ting Shen <phoenixshen@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, fshao@chromium.org,
	Ting Shen <phoenixshen@google.com>,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	chrome-platform@lists.linux.dev,
	joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: cros_ec_keyb: add support for base attached event
Message-ID: <ZalmGi_Zlm9HLoBy@google.com>
References: <20240118085310.1139545-1-phoenixshen@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118085310.1139545-1-phoenixshen@google.com>

Hi Ting,

On Thu, Jan 18, 2024 at 04:52:43PM +0800, Ting Shen wrote:
> This CL maps ChromeOS EC's BASE_ATTACHED event to SW_DOCK,

As far as I know none of the Chrome OS devices support classic docking
station (not talking about the new USB-C/TB ones).

> to allow userspace detect that a keyboard is attached to the
> detachable device.

Are we planning to have detachable keyboard that is not USB?

EC_MKBP_BASE_ATTACHED is processed by hid-google-hammer driver and,
together with the USB connector state, is used to form SW_TABLET_MODE.
The reason just the USB state was not enough is because the keyboard
could be attached to the lid "other way around" to be used as a stand.
In that configuration USB connection was not active. However userspace
still needed to know about this to activate tablet version of the UI.

Please provide more information why you want this to be exposed via
cros_ec_keyb driver.

Thanks.

-- 
Dmitry
