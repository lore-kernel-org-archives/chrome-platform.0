Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D662931F8
	for <chrome-platform@lists.linux.dev>; Tue, 25 Aug 2026 02:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787625143; cv=none; b=pwYPML5sYLzkPTDYoJXD0sy56mXUOGBTeWTIbGYpfeCtvs94XqBVK2ZsHgdMU2Wm//R8hs2SMU9R+gep5D3zzxWYo0nxqKpqOUv/C6MTS/zAKs3nJYaUfGbw5h9R4ySR+/ZuihH6AeFVk1rvz/adMVptd9YrNS+K7op66fR/NUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787625143; c=relaxed/simple;
	bh=hZkRUfAojg3eoNr8a0Rp4cL09Bvzpc2kCYAeV8McbU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VLSF3cGfVoCJPW8F1/woQnR0sZUViU9H/QvZmIIyW39sW2SSVcHYWwUMqOZgLD6+k2OKEThu5qVTzdZMuVyw5TG9c3qmRLNWiZh+BhgiiM2V5VEnmyPJyyorCX638M4grXPsv4BXJEA5j0pbMlxxSmDYYbs/b2lWAA/EsTke7mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3MmKTAZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3MmKTAZ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so5023315a91.0
        for <chrome-platform@lists.linux.dev>; Mon, 24 Aug 2026 19:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787625141; x=1788229941; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLkQ5gc0U0wdnCVZK4qJPIUaaZupYGShMqc57SGVIns=;
        b=I3MmKTAZvx6C6e6h4EK45ZuZefY5ckP7rhk1Y16Vw+GysCDYdkbTv1Il4OpFlbE14O
         OnQh6QJpBegmAetvu/0PjY/upi5FofXwaMq2ORkaLr1+pMGmC1d3887/LZkSThbEPjbB
         SIXRBobecH8Q1d45IKHeZkB6wlyQrxXaJ4CYYotfh/+CEWcPr8BpijNXCNnvJjS2tAZP
         Beu+T9IM2iyKRkCbQ7xa0rgWsCQqiTEoYk3ap0IDohy7kiLJr/qJNeQ1XSeKlZjCcUuI
         19ivA6tni2lx5BHO3qBJavFQSSgRyP9padW4aesDwuQBAJj0/H8/scTxvgPxrnG/6XLF
         CwbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787625141; x=1788229941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VLkQ5gc0U0wdnCVZK4qJPIUaaZupYGShMqc57SGVIns=;
        b=Xl9x5BW4yIEwdT4bW6fqtcd/RE5uFZijV2JsGED1gT45PwXQzrWZvGuOQYaRlN7Q1T
         /xdFqqbdlW7AMVqoBI++vfZeZ7BIyBLUPsuTwERSOOhp1Xjkc242NE9ZFSSO3CF5fICI
         XbVU9fPZpRUTpBcDWP92ovtlyt1BvHVBxniX+yGTWxd5XEXmVSbC3TQ8zGYbbtkKau9Y
         cKrka8y3IQ+JIyaRdKrpOer3C5f3JdusKqPDLOFeog2xJnM3fIXOd26svqYTQbtwStET
         F9/f6YJFDxkneff4gQ/f1jTv/SNjPI9TIKx5VeagD+i6NridCGyu9MfcU6cj1slphCdF
         OePQ==
X-Forwarded-Encrypted: i=1; AHgh+RooixHMYnDnVU65YIacjBMknlKvZ1a5psUZ4Ug5G2SAwN+tGXvn1SRCezm67cq2EAEwndS5by3TQcpFXkyvsgU=@lists.linux.dev
X-Gm-Message-State: AFuF++l74HfbJ1XgOS1D0VNGD6tqiMYbS65NHMHo1Aubwh2Ocau2+tOq
	0iwzlwMGS3hP7yftWEl3KusQSJSnumWIShraCmwr/DoBOgZWG9wN0f0=
X-Gm-Gg: AR+sD13tyYtQpYJ+IzzVsAGZGDnp+ePhz6VR+/sJZ8/OMEKYIBluyLpRymPB66nkJwF
	hPB3rB9f0nIaH9mzZiysDMB82WGzHX2FAtzFWGEw8Fq7AvyTrVVeFEl1HOMhkGA9DjLHwQWvxCn
	7jgl9IomXcNm2SNHJedVpaz9lWy+w0suTkrIBe8VADPQUoNn2H6Yx9Hcc78+/31T8VdWu6vEPC7
	tskcxRsm5C7fHkts3b2RHISWQUtPWHc1qmjAJSbhLP8zWOCXw9JbtwxJqEJIAgyf7OAm+8ea1FS
	vykOC0VjYWcnxRFdcryozpROv4lDKpYJ1BCErLf6PKMdfVJx8RkM+XYZXDuQjVHX41s5rh+b1B2
	OCDpaXHnYokVkNgsEfy2hiB+3sK2SEJR+RtnSyMmrjeHm+vEts+EFonk5gSMQcyKAtF7Dkhtooy
	bKPnoJsbFVZAzq1Anr2iJjCEfb/Ws7DIA4K7b2IdJX3d7qRhWO1NKJu1DuId6ygMvmp8wRO5X42
	g==
X-Received: by 2002:a17:90b:1d83:b0:380:9f17:6df3 with SMTP id 98e67ed59e1d1-395c3367376mr51215702a91.4.1787625141490;
        Mon, 24 Aug 2026 19:32:21 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396420ad8b7sm657259a91.0.2026.08.24.19.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 19:32:21 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
X-Google-Original-From: Triet Hoang <triet.hoang@datalogic.com>
To: tzungbi@kernel.org
Cc: andy@kernel.org,
	bleung@chromium.org,
	chrome-platform@lists.linux.dev,
	dlechner@baylibre.com,
	groeck@chromium.org,
	jic23@kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nuno.sa@analog.com,
	triet.hoang.dev@gmail.com
Subject: Re: [PATCH v2] iio: cros_ec: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Tue, 25 Aug 2026 09:32:16 +0700
Message-ID: <20260825023216.43373-1-triet.hoang@datalogic.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aoz1VN62zEuKPePl@google.com>
References: <aoz1VN62zEuKPePl@google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 25 Aug 2026 01:52:20 +0000, Tzung-Bi Shih wrote:

> This needs to update accordingly: SIMPLE_DEV_PM_OPS() + EXPORT_SYMBOL_GPL()
> -> EXPORT_GPL_SIMPLE_DEV_PM_OPS().
> 
> > 
> > This lets us drop the __maybe_unused annotations from the resume callbacks,
> > and reduces kernel size when CONFIG_PM or CONFIG_PM_SLEEP is disabled.
> > 
> > Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
> 
> With a nit in the commit message,
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

Thanks for your review. Should I send the v3 to update this?
Or maintainer will 'amend' the commit message when apply patch.

Regards,
Triet
