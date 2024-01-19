Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA8DDDA2
	for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 08:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705652015; cv=none; b=RkYIdO8ZwgqRBobQGs2Y/r9USgNEwx0zgrotZDsE7KGPnHX4pc+gCDnxG5vDGvY267yAWKoi4vNp/Jdpjh7y4gpcU5V/kXUOP9LBSn3srfqCl3lHwwNLD1KAKSv2WJ27FwZ9r0gpeQNGKEmoP28PHVn3CG8nI2jnh1sGGoimyP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705652015; c=relaxed/simple;
	bh=UahqVqM3JBOxpq4zFQmkBUy5zu7nEiUADTkUEncGEdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jnl88t4tuIPnM5YjVN4l/DtA3NB+4J5YDoPJ8Um0aTuFDKnCAcYiZmTftB8C5bzh4PurZGDvlUh1BTh8M/YGi6+l4df+16z5oOU6mhgI7W6kkA3eubHAeZn/pmYPnnvYzpCC7eNRj6X6DqeH9Me/VfiOdPso9v+7AcMJXB6YHPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WE/uCHmu; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WE/uCHmu"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1d5f56912daso3953835ad.2
        for <chrome-platform@lists.linux.dev>; Fri, 19 Jan 2024 00:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705652014; x=1706256814; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bWIUa8grGZ6qMtkdYnja/ujmQxTTZOY4hekmMuMez50=;
        b=WE/uCHmuMW+Pqz5veKzVicF9M0gdT9TdWF+sW1tb4b3RRtjlr7MU320k6CKrKB9evK
         UuInINFKiTqTS2ewP3gJswwhaiM2PWNLqeJ0X8s+9MFwVke170s0J5VjKVDSccjZi8rz
         8AsMxG7D5N4yYxZ7y82H9XQsh8KwUxl+A3nno8TswoM77bz2a8WzF3e++F4dUmjLhvvD
         ij0ybvj2ZZ5s6FEGvwaqiTSFalIgWmQGEIARyQzLfH+tvsRUTWVuDLJya536Zyh9TWhA
         EGMTamRA4YL8NIKqArwrLa1RTG0WBG8uVtu3MnDirBaw38+W1hIPL2/kDtw9eHOE+IZO
         u5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705652014; x=1706256814;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bWIUa8grGZ6qMtkdYnja/ujmQxTTZOY4hekmMuMez50=;
        b=vERRO3h+wSDo/W2qOm6af6CfetU17+GeJ/ZP+COeuIyj+VmkHTCHo9d98qC7n/ihl7
         JhQ4pDSU51JWpGghbvWT3BC5DorQYHEt3T0pntHPsBqyg2hYaGkEmIaJvS/rAdc47MDZ
         TolExd4xzQNGERSWLJDNFPw08oo8HNsWab9Bfnm6nzKlVCvKDlDfhhAtStUAp5THr8Vk
         pjy2Pw0hTkwlAdqc5uUBtCb379fFP2/A4dylUId0L6XFs3NM9RHkogMbMtYigufWRtBB
         B7DblFEIMs4tlruSCZKKYNQ6s5fIvE8uXYFkpKBLodviXMfzfOUpoeOmmHwNnwy/lhSS
         9Dkw==
X-Gm-Message-State: AOJu0YyWeRlVeqfAehn2erCmd3IYtfuFqZgP3qaXxuRp4SHmFvKGKG0+
	y5HE/l7VcpFbZeOuNRqwsJpvTh0Q4aYPofIyfc3ekyvi/Fh4rDXw
X-Google-Smtp-Source: AGHT+IGwPP+nORDZfwLHv8lo1KAHyYWdbUn5sfvkZ9EhS2YXheyZqZsey8KcJ1nmwbtVODOGlBdoEw==
X-Received: by 2002:a17:903:244d:b0:1d4:e0e:fa1b with SMTP id l13-20020a170903244d00b001d40e0efa1bmr2706430pls.57.1705652013703;
        Fri, 19 Jan 2024 00:13:33 -0800 (PST)
Received: from google.com ([2620:15c:9d:2:f04f:73f4:b79:a70c])
        by smtp.gmail.com with ESMTPSA id w6-20020a170902d3c600b001d71356f16asm490167plb.289.2024.01.19.00.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 00:13:33 -0800 (PST)
Date: Fri, 19 Jan 2024 00:13:30 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: =?utf-8?B?4piG4piF4piGIFRpbmcg4piG4piF4piG?= Shen <phoenixshen@google.com>
Cc: Ting Shen <phoenixshen@chromium.org>,
	LKML <linux-kernel@vger.kernel.org>, fshao@chromium.org,
	Benson Leung <bleung@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	chrome-platform@lists.linux.dev,
	joewu =?utf-8?B?KOWQs+S7suaMryk=?= <joewu@msi.com>,
	linux-input@vger.kernel.org
Subject: Re: [PATCH] Input: cros_ec_keyb: add support for base attached event
Message-ID: <ZaovKvmhEsEO41ti@google.com>
References: <20240118085310.1139545-1-phoenixshen@google.com>
 <ZalmGi_Zlm9HLoBy@google.com>
 <CAM106_uNOrpiovEuuyr2yUGXFpQqAiE_GQRFh2_j7v58cEvWbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAM106_uNOrpiovEuuyr2yUGXFpQqAiE_GQRFh2_j7v58cEvWbw@mail.gmail.com>

On Fri, Jan 19, 2024 at 03:47:32PM +0800, ☆★☆ Ting ☆★☆ Shen wrote:
> On Fri, Jan 19, 2024 at 1:55 AM Dmitry Torokhov <dmitry.torokhov@gmail.com>
> wrote:
> 
> > Hi Ting,
> >
> > On Thu, Jan 18, 2024 at 04:52:43PM +0800, Ting Shen wrote:
> > > This CL maps ChromeOS EC's BASE_ATTACHED event to SW_DOCK,
> >
> > As far as I know none of the Chrome OS devices support classic docking
> > station (not talking about the new USB-C/TB ones).
> >
> > > to allow userspace detect that a keyboard is attached to the
> > > detachable device.
> >
> > Are we planning to have detachable keyboard that is not USB?
> >
> Yes this is for a non-USB keyboard. The keyboard is connected to EC, and EC
> forwards input events to the host.
> 
> >
> > EC_MKBP_BASE_ATTACHED is processed by hid-google-hammer driver and,
> > together with the USB connector state, is used to form SW_TABLET_MODE.
> > The reason just the USB state was not enough is because the keyboard
> > could be attached to the lid "other way around" to be used as a stand.
> > In that configuration USB connection was not active. However userspace
> > still needed to know about this to activate tablet version of the UI.
> >
> > Please provide more information why you want this to be exposed via
> > cros_ec_keyb driver.
> >
> > Thanks.
> >
> 
> The main purpose of this patch is to have some signal to trigger the
> firmware updater (hammerd), EC_MKBP_BASE_ATTACHED seems suitable.
> EC_MKBP_TABLET_MODE is also usable but may be too noisy, it fires whenever
> the user flips the keyboard.

I think this can be solved in userspace. You may consider emitting
uevent when seeing EC_MKBP_BASE_ATTACHED from the EC. SW_DOCK input event
is not really suitable here as it indicated a docking station being
attached.

Thanks.

-- 
Dmitry
