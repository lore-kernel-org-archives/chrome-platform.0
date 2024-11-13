Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 165DC13CA99
	for <chrome-platform@lists.linux.dev>; Wed, 13 Nov 2024 02:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731465499; cv=none; b=LV5NlE6BbKkwPI8cABG0Ez+WTqIONalAAFbpWzANG3/16rwN1u+raqa2Dzn0y811+7RK8WcGsOSHKd4HkIfquEEUnK+SaXOti4VcOPPmUtsEwsvYf6xXu+D/wMkbuYAKV+OheWX+k7LILPL5dJekThzWFuumSvtIxGj/Tsw2/Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731465499; c=relaxed/simple;
	bh=bEMXAojs7dQlxuR19vx71TcyEikaADEHLaxXpr9+0Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GaGt5vFd2EoW51DRw9bHdKRUQa07ZGvQO8bRItiOVpsseMQAcV9Wjn2qpabYfcOk1LqLp5rrcU9J4wpjz1psmGmB7kKdD84hkiGWYvHqpFFzGM4kGS9hKeaSxLFdFgVQZxStWuXcAClh8OIsV0GiOS96yXPD6tX0vWJXwdUIRjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKZXc1WT; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKZXc1WT"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6cbe90c7c95so47990216d6.1
        for <chrome-platform@lists.linux.dev>; Tue, 12 Nov 2024 18:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731465497; x=1732070297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BDa364HRisrh5FkhBRAgoYWJ6EQLcIRifta+xIO2gRs=;
        b=WKZXc1WTKE+TKNcKrxoGaKOAdkPvKjmEPNaG+2jBhxh9workKz+H5S4K/8/Pny0zCy
         qmAYXahIW+2PGW7+IDWgbEh2vqPFE26zov0VMsr88RQbn+RELYX4YHoGSrdqiiYGxO+Z
         na/CgRSyeud9APE0JpoR9vlJ5vKwlTdKPNh55suSd4KUJpcK0jDpzEfCqoIIu+z6/HaC
         3uHMxm4Z214aYgFkmLWe9/gUANRTdBgqDu634i4MdrW3Jh2HDbCQMJFzn0i+OzbeNOwO
         WqYlLeiZmpVovWfw0XfHcDR/apMPpmIi/ueqjS0sOdWMksryR3ijS+aWkD/2EbsEglgb
         c52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731465497; x=1732070297;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDa364HRisrh5FkhBRAgoYWJ6EQLcIRifta+xIO2gRs=;
        b=jDBbL/sJju4nuPUekhUclHPlFmD25DfLC2y74+loT0BvNNN1zEOkNJdtdYRDE6c/53
         BMov0GGLZCo3mbrB+o/vH9UxEjLw8frdcU6ULPc/g/4lIrr+efbomighmPX9LWOLeKEY
         3E8Q5uw02C4HKGX0HGxWOvP0ywr4WA3yXo3X1ttlfNfO6rSyfPH2fb4KL3GjfMjqVAHt
         0T7lm03gkGgWnMymJs5tctPmBILkJSFAleNGBRSc+3fjQG44hFFEF7IvTPIEmL1aF4PK
         zH0cLbXyke+nM1LvcyNtqK2785mDyv+wm9aLRF850efMvOO7Bx9V2gn9WhdMPZJ8PTYt
         e23Q==
X-Gm-Message-State: AOJu0Yzd/RH/5Ad8pqrvExD0pTfMZdaqINBqVZVQlhrg4UVx4OtzW/IJ
	z/6WXF55Pm9WDnd0tcwI1GhB41z+moZqzH+MLjFwh470IHq3LNnf
X-Google-Smtp-Source: AGHT+IGc3inXxpm8jaKojJuuia67ySeFfCUQL47bMuFDUWAFuzpojQ8jYW8dWSsemnx/d5Q/9Xj9wA==
X-Received: by 2002:a05:6214:33ca:b0:6cb:826a:f20a with SMTP id 6a1803df08f44-6d39e008af7mr275618056d6.0.1731465496977;
        Tue, 12 Nov 2024 18:38:16 -0800 (PST)
Received: from pixel.. ([37.19.199.148])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d3bf23cc01sm35444306d6.122.2024.11.12.18.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 18:38:16 -0800 (PST)
From: Brandon Casey <drafnel@gmail.com>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev
Subject: detect kbd backlight on Google Link (original Chromebook Pixel)
Date: Tue, 12 Nov 2024 20:29:04 -0600
Message-ID: <20241113023800.6263-1-drafnel@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Hopefully this is a trivial and obviously correct patch that will be
easy to accept.  Tested on my very own Chromebook Pixel.

Please advise if this is not the correct mailing list or procedure for
submitting this patch, and/or if there is anything else that I need to
do.

Thanks,
-Brandon

