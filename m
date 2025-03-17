Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC2B214A8F
	for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 07:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742196500; cv=none; b=PUFiBYN5odKmDCHWQylAOFqz4W8N3rB/9Twq7lz1GAUaynPvst64R2ibF+AMQEnW8lHj0IFJ7wzlisCj6EXCFOsv+sLKLOgjaeUtWNaMIb7t7zkg9m6AVxsN76Rn8Cpm0Mn44zJiAdUI1EZGXZG9gXKS3KX859NKT+h14Fb3xKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742196500; c=relaxed/simple;
	bh=JCZ8NJHlL5qeLs16kSk8UAGx4B14ozu5Wfh9P0ZeBWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bVea2iW7DmKn5Lzl+JCBgq0NVlI6xhTaDr3u0VxiI52LJss+R5C7W2JyDAwbiXw5NaOpEGV1oBg3cmn5XomhumzIrpdJDbPRVMhlgTjmqpW2iLH5pof/ZKQFH36OwnqxCxQ4XJ8bO7rYi1aMb5XlHPUCrjPFOIPgxfWp54Qjrbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fMjcT59i; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fMjcT59i"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39149bccb69so3957424f8f.2
        for <chrome-platform@lists.linux.dev>; Mon, 17 Mar 2025 00:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742196497; x=1742801297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmeybRpBrE7pprKBEyj/DYqPzBvtjQqQQdCE2g+fCIc=;
        b=fMjcT59isNpcYiObSO4eECEbvaJCP/c/9/KF5twj8Zuz13kU4veaz2A3LXw3xSSNB4
         Oq1xixxC9qNtadbxsce25kl6+7HS5qf8bunomJx/NJZkSLFX4cQk+1qP/MptZ8aeQn5L
         sMuZ2qHN4jIkoqg5j4bly1syviD7lrbtSw5SI8DgXuuoYJJDx003LNz43m5y0tK0OKFW
         db4wI8qfcFm9jKkXAqN6gSIPxf28yKGmq2l2j8OaN63McAjhxv0Nhtc4rbUaPWZLfRSk
         bdP840/1KE7l6ai4L2uly4wTjDferos/EsEywJQTrRh07fo8+zWGFDGnedb2JO0GQpma
         LbqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742196497; x=1742801297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MmeybRpBrE7pprKBEyj/DYqPzBvtjQqQQdCE2g+fCIc=;
        b=uVpwyO1LbHm1elMi9JWm34fRGt8gm5Gk/VLo1KFynC5mZRKb0CDQnrW7FBWE19P+pH
         4F42RPqkZXAEzj31iC2J3IQC4832CORh8khVZMpB26wyfGsx73bhFSveTjSbmAQfxk0l
         dv4oxUDXxSb4UkkFCB3H+NmuTB/NECBX1Jx5lfcP8+2T/wMInkDkrRaycZ8Tg0Am0esx
         PpPeHvZ3my2pvz0VeFjYY40NRaIpdY38lg54OejaX3UNVyeKbnRyNvkBS2WFfGmrQbPY
         OMwoEI+SYZX0DuowXwDEZE3L9QO86y/vJhkFvn7WTk/VbkZ87bbzC79PDItpRfJlSaIH
         VjEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpwCbqXmzNZAuIZbpZeN9MImAhl63hJViZhTXe/s5D08llmzmuGDgWMf2n/+lzyViFO+KfvcIFL0f4j63Q0GA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyHRZTC2h6CO/IaLRxBLojYVQAcEdZy+6D+ipTHsQ/BPbOnWDzJ
	ZNJ5cufX6eEI9i0H2Zten2PWrNUJDwc2EVdipf7kNXYED05e3GKMNnluP7GLgxs=
X-Gm-Gg: ASbGncs8gYkuhIRWKKwKDgHUb59WPyEgiIz3iozxq6q6aWwepOnDEgE8QuXbsbwJkL8
	hyrIrgotUQ/hbpdR0H3eS5izjYOsSaIBUv4fouBxEpp7E4jJalBFs7s71sDSlMB9fGi8XuIspaL
	pvAQtmTo7vPoFZ+2hvLsLjqL4AYDFoi6dGlj9MoVGyuvBxvfpoXSoyYlUAwVe79FO3pHUQb5TOZ
	WAiFNp7jIJ6sYcOJkrag7DADMzKYkblIj5DOPBujwRKd9EL9bQuQH7NMhZ5dhTu0bIBaDsbDyLP
	B/kZKKpMm7tF0Ov8fc3NvZEu2D9NkIOUJJePAZtz7Dxy
X-Google-Smtp-Source: AGHT+IF0SQg1rbhlVfPRDe4evUEMB6cbst75qf2siyPSgaa7hhC48ie0idr/zrL8lWoqGTejEIooqA==
X-Received: by 2002:a05:6000:4025:b0:391:2e0f:efce with SMTP id ffacd0b85a97d-3971cd57552mr11869458f8f.1.1742196496768;
        Mon, 17 Mar 2025 00:28:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8f96:5dba:51a8:70a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df320csm13962684f8f.7.2025.03.17.00.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 00:28:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ray Jui <rjui@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Michael Buesch <m@bues.ch>,
	Thomas Richard <thomas.richard@bootlin.com>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Andy Shevchenko <andy@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH 00/15] gpio: more gpio_chip setter conversions
Date: Mon, 17 Mar 2025 08:28:14 +0100
Message-ID: <174219649255.10395.5377350063272830181.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
References: <20250310-gpiochip-set-conversion-v1-0-03798bb833eb@linaro.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 10 Mar 2025 13:40:14 +0100, Bartosz Golaszewski wrote:
> This is another round of GPIO driver conversions to using the
> int-returning value setter callbacks.
> 
> 

Applied, thanks!

[01/15] gpio: bcm-kona: use lock guards
        commit: cd7d117a297149b61871d441fa1a8146c55c435d
[02/15] gpio: bcm-kona: use new line value setter callbacks
        commit: d5cc72803b146c811b01f9a5b91e97337adf5784
[03/15] gpio: bd71815: use new line value setter callbacks
        commit: 7bd2bb7901a67f6b14c913596acb471351f500a5
[04/15] gpio: bd71828: use new line value setter callbacks
        commit: 8a050f738d41d337fb73ef582916328dc5bd73e1
[05/15] gpio: bd9571mwv: use new line value setter callbacks
        commit: fe7667f2085ee7d66a6a34e6bf6830be7e641b52
[06/15] gpio: bt8xx: allow to build the module with COMPILE_TEST=y
        commit: c948feeadba290e989b049913576b3d30ba02235
[07/15] gpio: bt8xx: use lock guards
        commit: b9a557d05a7dde42b1e3652751eea6c06091402e
[08/15] gpio: bt8xx: use new line value setter callbacks
        commit: 19c39c53752ae0b5cbf7577bcdf7c13d1c146e65
[09/15] gpio: cgbc: use new line value setter callbacks
        commit: 1e69c7532a188a84b4cb535944fd7d60393a1fc8
[10/15] gpio: creg-snps: use new line value setter callbacks
        commit: 68f5b74e0db7ab57885ad4ec05f7418cac8f4063
[11/15] gpio: cros-ec: use new line value setter callbacks
        commit: 2661dc2de18617ac827aa9b50cb145bf5a185896
[12/15] gpio: crystalcove: use new line value setter callbacks
        commit: 96498b83b3ded5f01207775d681374d62111d548
[13/15] gpio: cs5535: use new line value setter callbacks
        commit: 588dfcdb162855b954f92fce73a12e3fa86ded01
[14/15] gpio: da9052: use new line value setter callbacks
        commit: 489c19cee3b9fd58e7967dbc4e54cdf212b073a0
[15/15] gpio: da9055: use new line value setter callbacks
        commit: 2eb5dc9a4b0d193b27289281faa05aadab978b41

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
