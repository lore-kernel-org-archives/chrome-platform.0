Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18791A4E9D
	for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750082498; cv=none; b=nV61K8r2873FjsNBMN22GcnEzJA5qh9NWgViYumXw/Q+Ihe/ePvIGGJf3XaDAi0CuOAxYUkMEWlk7yRIulowC3b5sfQU10jzwQ2NtMHfO6TQ8am5vbadC48BFeLh1hhB9JqQZz1AyQ7+QUNn4miWxbnE0PPyNicGD7Af7AzNEkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750082498; c=relaxed/simple;
	bh=Gtx6sUxQErhezdQ0ZBdohRBHe8yymdzZfpR6qSMLmQY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VvZUredjIvMOkGAHsqu/ktwnU7Iw0atlNyZd1KOD30M43Qgpz7ExdKzz+o2x2RscZovcePwLEaDpRkA1ei5xiG9yJRbbGhCgIYVuTGQMj8FzCt/5csHan+vgN+of3OQWDxxwybRip4TwD2ywmJd32cImeGz5xTBJX/HN30zq84Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=QS6ult8p; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="QS6ult8p"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so43837375e9.3
        for <chrome-platform@lists.linux.dev>; Mon, 16 Jun 2025 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1750082493; x=1750687293; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dEPSwYHUllcVF4aRV6d13dYuoz2IZroq08Q5FVCs2wY=;
        b=QS6ult8pFlwLqZmpplcHg39m7OyU7COKqu1+UT+wP5fNY0XhqiLIVopvqWQ6U/QX3N
         Yvfq1ZmwTyBUFXHp9x138m7QYaYykZ8sD5YYgHPjH/lvRU3Oqd92nB1bLOC6AcsLk6D4
         JU33VYT62qPITLDMJfmgcZxvhgldUYbVSryTmaj+Yg6CbxHdfp6bVBoeKrXkBFFQjF2l
         zMaWEDCciXgnZZjxcKyI/v7oPgaiwGxQVWGEkuyRKtYmua/G4a2IJ3Iu4CT6JqGFg2Q/
         uUAR18KHJu/wyBTu45MEU1pXzkHoAuBXnyC1wucyQL/bPooc1br9Ky9GlL3UjqMZColL
         qiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750082493; x=1750687293;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dEPSwYHUllcVF4aRV6d13dYuoz2IZroq08Q5FVCs2wY=;
        b=VyNYOiyGVneWlPApoP4Z734BrROi2RM0Q4j3V2mpcwNNPfxJbfdLCzwCwXjn3ikmMK
         zA0je1P/0JesexS62s+nGovr8eWsvdcO25xhB5rpZmO9lu6O04QY405x0tUPD9bCybe1
         2zxnfjGvenjCZtuPmA83I/qKfARdgSdo/frTFjoBic5GM12sJtez0iepq6m9/4XeTLEl
         5A4+gLk7W/zSP3qAy+oszqMh+6f5nAHOIJOf5GkwFEvc/LGi4gz1HZodkC3yjeunbEFd
         IgzIWzVUyYN87+TCn6Z0sYNYFFQ2wMZF1jHZRbxyMp9o3JrMSdbEXFt+EjBNKwycyWA2
         QYFw==
X-Forwarded-Encrypted: i=1; AJvYcCXXmAkDbEekFcwF0eMc3Z4ts6qGr0DJH1PIVa74SFcHPs+BszAu7+lVz3NbW8itMfuTkDqbgGoRZm39OBfVIzM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/f+xh9y+rTMyuEIUcCtXSgUklaV8G5FhVjnB8bUWk6f9B5vR7
	M3LHcrWdaoBzopmYrtnHdxjZ7V4doxwxBmy9H3AFBTI52uRi/4sxnvrpIXS3OFE2p2W3z+E62nh
	F6+0=
X-Gm-Gg: ASbGnct1ZbnVztKhH3ZcTcJILPJh8e789o9gmHRsMC3WOi8vnoktLQe1L2bO1/iUOOG
	2CPEGbRzz+CMfsAfYPCCUHLHpT23Ix6I8SUqdy2DQlrHaK9l878AoIM2D9Iv4T06KneehR6OHRv
	AeWzHyylFMNqD0hp3d5HObE3yrqS/iFik1ElQGPLM/I+bqpyobWkvWnTItGrUetsKsKf1Vv1ouz
	Pr5pvIoJSbIWWtSAdX3/g4eoXIiwcuNjtkB/55BdbgPpaJFdATvBd2HRcthOwBf3fUO4rj5tQTY
	4xaA19qzuM56uJUfhORGhU5y8egF0HQXlfsRGgljdQTiQhyvNWiphOb2DVrHILlo9q37Wp1DXZs
	s5D3Z4LIykBQ8gi/9Pvk4rtFmDqcyZh3qu7yFxwFjcmxvpA==
X-Google-Smtp-Source: AGHT+IGHQyOwAUqFexF8zEmL4xFPsfu+VrWSUnxlqdmY15C170Uug2RcV1kxtPgOG+gygg4D+hT0ZA==
X-Received: by 2002:a05:600c:1e1d:b0:442:ccfa:1461 with SMTP id 5b1f17b1804b1-4533ca6ace2mr95735965e9.13.1750082491142;
        Mon, 16 Jun 2025 07:01:31 -0700 (PDT)
Received: from [10.93.128.132] (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7e51esm11057004f8f.40.2025.06.16.07.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 07:01:30 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
Subject: [PATCH v2 0/3] firmware: coreboot: Support for System Management
 Interrupt (SMI) handling in coreboot payload (MM payload concept)
Date: Mon, 16 Jun 2025 16:01:11 +0200
Message-Id: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKcjUGgC/x3NQQ6DIBCF4auYWReiSLV21Xs0XQCOSgKOGYhpY
 7x7ictv8f53QEL2mOBZHcC4++RpLVC3Ctxi1hmFH4tB1eped00rHDFaoiw28wtkRhGj6DqtrNV
 KPbSBstwYJ/+9qu9P8cQURV4YzdVytCPLptdD3+p60HL2WUZf/oKciYNJrwEDRlxzko4inOcf9
 JM//6gAAAA=
X-Change-ID: 20250613-coreboot-payload-mm-6642bb42284a
To: Tzung-Bi Shih <tzungbi@kernel.org>, 
 Brian Norris <briannorris@chromium.org>, 
 Julius Werner <jwerner@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
 Marcello Sylvester Bauer <marcello.bauer@9elements.com>, 
 Michal Gorlas <michal.gorlas@9elements.com>
X-Mailer: b4 0.14.2

Hi,

This patchset adds support for MM payload when Linux is used as
coreboot's payload. The main idea is to delegate higher-level SMM
functions to the payload, limiting the coreboot's System Management
Mode (SMM) related responsibilities to the minimum of basic SMM setup [1]. This is
done by loading a blob with SMI handler to the shared buffer, from
which it is copied to SMRAM [2].

The MM payload is still in a Proof of Concept stage, and we are still
working on getting the patches needed for coreboot upstreamed, but I would
appreciate any feedback that you may have.

Thanks,
Michal

[1]: https://github.com/9elements/LinuxBootSMM/wiki/Proposed-design#current-design-approach---mm-payload
[2]: https://github.com/9elements/LinuxBootSMM/wiki/Proof-of-Concept-(PoC)

Changes in v2:
- merged mm_info into mm_loader
- removed mm_loader_exit in favour of allocating memory with devm_*()
- added forgotten "\n\t" in trigger_smi()
- added gitignore in mm_handler/
- added COREBOOT_PAYLOAD_MM dependency on x86
- error handling for mm_info struct
- error handling for shared_buffer
- removed whitespace changes in coreboot_table.h
- removed INFO level prints 

---
Michal Gorlas (3):
      firmware: coreboot: support for parsing SMM related  informations from coreboot tables
      firmware: coreboot: loader for Linux-owned SMI handler
      firmware: coreboot: Linux-owned SMI handler to be loaded by coreboot

 drivers/firmware/google/Kconfig                  |  12 +
 drivers/firmware/google/Makefile                 |  11 +
 drivers/firmware/google/coreboot_table.h         |  11 +
 drivers/firmware/google/mm_blob.S                |  20 +
 drivers/firmware/google/mm_handler/.gitignore    |   4 +
 drivers/firmware/google/mm_handler/Makefile      |  51 +++
 drivers/firmware/google/mm_handler/handler.lds.S |  46 ++
 drivers/firmware/google/mm_handler/mm_handler.S  | 510 +++++++++++++++++++++++
 drivers/firmware/google/mm_handler/mm_handler.h  |  21 +
 drivers/firmware/google/mm_handler/mm_header.S   |  19 +
 drivers/firmware/google/mm_loader.c              | 215 ++++++++++
 drivers/firmware/google/mm_payload.h             |  58 +++
 12 files changed, 978 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250613-coreboot-payload-mm-6642bb42284a

Best regards,
-- 
Michal Gorlas <michal.gorlas@9elements.com>

