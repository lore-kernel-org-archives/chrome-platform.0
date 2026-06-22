Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127261D54FA
	for <chrome-platform@lists.linux.dev>; Mon, 22 Jun 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782145889; cv=none; b=Zbe4KlncBWNHsz0vrZenDEUAoIgC0kl+6FNU9CzUfiP714PuW9cr8OygsmzBVuItRU/4LjdoxntKDSwA0qqWhnHBATIu9VDSWOjOizL7i9A6yqF9TWJjMA57p0DAdu4f9JBKvDwU/1qffQ8XnbU8DsmFab9fx5Ymo7sd3T7U6jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782145889; c=relaxed/simple;
	bh=sbN2IvOg2ud12goZ905jHs/wv1LSuIuLCyu54wgd9k0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VYbasgTD61FBr/7Mxp8e76DpgWxyPGGyisZ80rYHZ1z5248lr/1u9713baeuLYkflhQpdSrngvMGJRuDGZ1IelZ+LE8vymxTbABHaCUdoYXVankssvuqSMUAA6rwfHR92eOoBJWbXWiVaZoNrvhlrJElXjO9av1btWxQvxSmVEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YfNh+5l5; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YfNh+5l5"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84347ad88edso3915129b3a.1
        for <chrome-platform@lists.linux.dev>; Mon, 22 Jun 2026 09:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782145887; x=1782750687; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JTyqFVZu7vYi4ab/1L2xK2yqznOeuVq55CilqIa7E24=;
        b=YfNh+5l5gOe2lGLwPogLtxLVSVt8Dp5p+rB71NVdZWkF5JRqP4v4+bhCpvwUO5OCMl
         hqUFVCYkV0nV5GYiN9W4j9BCG96cyjz8zdRAE9KkNstyduY0mS9AlJBMbAabSbRYX9a/
         D27JB/A2WrF6WpPfvBf2YimCXxza2GCZKgE46lPTSu5aHdRA52qusXt1nb4stQPDvmZs
         ko2toR52aVMKSTMC87UPxLyjGuTzf1zHYlWsORC4CQPQZp23YoST8MJ3mC9x66G0d9hB
         gUbrX9Z5q9R9rV7EKh1/IBwFqwY9C5SHPFUOsoProyHaUrIcdcttzcXAzfuQ5wIZGVbm
         Ui2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782145887; x=1782750687;
        h=mime-version:content-transfer-encoding:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTyqFVZu7vYi4ab/1L2xK2yqznOeuVq55CilqIa7E24=;
        b=RHLRbTqAHQYV+GtJRbGKIoqdJeeYlmCi4DDXKFhln9JKzgqjE4caTUqmC0aub6z2Jy
         usfH5uM7H7J3yWIm/zzn+japQtsMBeyVQaMfbvbJTWFuul65k7So0gaXg+5gpfmfPFdl
         Rh0xG+4k1YJbj2YkVHm93NRzHn8Ij02TO6DXDUK5hRSsmO2Jr3KGj3K9+1jZ5QVikoDf
         2LgppsOP2dVKZqcsvD3/uOVv0Io2bqxD54zedsmkmHiF8ug4M4SRjIjsaySUw//euDwr
         zgu6SQimj1FZyE0B2h42JEzlE6lqAWJ+C4u3FsjuL4BdOz7gW/3/OVYWnQCX/Y8OWDwV
         gGYg==
X-Forwarded-Encrypted: i=1; AFNElJ8nQ/LNoNXCTOV4UNHxzinVZ2FUNWYoC4UKSgsU1MtNCDT9exEQ1IVXpX2OGBYCoQ2+g5eVChPsUN8vmhNXBJ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHytaaE75zldBSMM2zFy1rKoB1qBM3Bcy6g+RZPPZR+yEEbx6r
	3+hK0JcP356jz4h5GMDBk7be1hmlAcV9YbsTcOCDOcHdHubTmY33pt3M
X-Gm-Gg: AfdE7ckJf23ZuUq1ypqX2U0AyWI9/ViAhMvDD2zslqOisXZLxzMbYGCaDiAgo7O0lsZ
	JfUag3mhYUhigaqEm2EYaBuUCVMDE4LJotYAxXHJqQVBr1w1nLPSwi9hVr4fhQhKaRv+KQ+dF1h
	YKER3lfqVLi1DkQTJEFE/9mp+bi9RX7e2WbI/qrvCFV4dSD4ChHkIqIhPCf023PZuY92yjd7+Ds
	hnOQUvRp8lIFDx5puXjUuXxsVXqK8mid6oiPk1SA+U582Vy5NU9T2p0gHYmC09s5jHENWP55THt
	9r9RRFIKTRj71hCcFeT0Un64P1Cg60M+Pd1v4aiCgFrHMt1ehZWbqrH1lBvhO8IY+yUtLerUJF+
	FSic71zgAuOZjCb6coUmmQ48ki9MtUF+Wu1o9PWNVa6HsVtMBaLJtQDrg9A/iV97GhlTiRG3Eey
	50kO3wgmJIfmrg1Fh3Lf6n9pNJicJmbF7+sNiEhUXkxGyiinUS
X-Received: by 2002:a05:6a00:f91:b0:845:2ff5:b676 with SMTP id d2e1a72fcca58-845508a1a8cmr17080164b3a.33.1782145887225;
        Mon, 22 Jun 2026 09:31:27 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564d8ddf1sm8242574b3a.14.2026.06.22.09.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 09:31:26 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Benson Leung <bleung@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: platform/chrome: cros_ec_typec: unbounded PD cap count in
 cros_typec_register_partner_pdos()
Date: Tue, 23 Jun 2026 00:31:22 +0800
Message-ID: <178214588280.2375438.11710758336343332732@maoyixie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi all,

I think cros_typec_register_partner_pdos() in
drivers/platform/chrome/cros_ec_typec.c can overflow the on stack
caps_desc.pdo array when the EC reports a large capability count. I would
appreciate it if you could take a look.

The function copies the partner PDOs from the EC response into a fixed array.

	struct usb_power_delivery_capabilities_desc caps_desc = {};
	...
	if (!resp->source_cap_count && !resp->sink_cap_count)
		return;
	...
	memcpy(caps_desc.pdo, resp->source_cap_pdos,
	       sizeof(u32) * resp->source_cap_count);
	...
	memcpy(caps_desc.pdo, resp->sink_cap_pdos,
	       sizeof(u32) * resp->sink_cap_count);

caps_desc.pdo is u32 pdo[PDO_MAX_OBJECTS], and PDO_MAX_OBJECTS is 7. The only
check on the counts is that they are not both zero. resp->source_cap_count
and resp->sink_cap_count are u8 fields from the EC TYPEC_STATUS response. If
either is larger than 7, the memcpy writes past the 7 element pdo array on
the stack. For a count of 255 that is about 1 KB.

The counts come from the EC and reflect what the attached Type-C partner
advertised. A malicious or malfunctioning partner or EC can push the count
past 7.

I reproduced the overflow on 7.1-rc7 by running the same copy with the 7
element pdo array and a count above 7. The copy past the array trips the
stack protector.

  Kernel panic ... stack-protector: Kernel stack is corrupted

A clamp of the count to PDO_MAX_OBJECTS before each copy would close it.

Does this look like a real bug to you, and is clamping to PDO_MAX_OBJECTS the
right fix? If so I am happy to send a proper patch with a Fixes tag and Cc
stable.

Kaixuan Li and I found this together.

Thanks,
Maoyi
https://maoyixie.com/
