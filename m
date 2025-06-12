Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12EA24DCF2
	for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 14:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749737192; cv=none; b=IYFDEMdFJRYAjP6+M9iAuvsyJyCoXHn22XTBdWY6Xzan+0mn6n92Ah2U1r6zKvyjLjCAcqTr0NynhjYidea19eW4/6CfF4b/5thn8pAWQr8OeyAoaxITqM/F2qztIgmrzIEWym8BMwok9KXgH6eQKLQfBLWCQ88GtaYUV8NeaJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749737192; c=relaxed/simple;
	bh=rjkese1ZifOLjoOrKAvw4hTS2D4WjBORKNmfBqXMWsE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tilSkg0kZoa/GFNCypALYJUUUBgc2vsoJ1W6ETqMvqwfS7uukYoS16d2Mc3HDOj9ECfYzbgfGwh5fjgBemcpX8avJolVLQdT8hd3877fBd2qkYDtb/EQH7TVX4YOjMNO3Vu5MvBbThTA5lXNvkCEafm1tnFcJW5PhjCyMEVBEjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=Xjd/1EQ9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="Xjd/1EQ9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso1104928f8f.1
        for <chrome-platform@lists.linux.dev>; Thu, 12 Jun 2025 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1749737187; x=1750341987; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ttsYPqiggEy9hPbgSqnq/DvaBZU+dCuBO6mxXYZ0sE4=;
        b=Xjd/1EQ9zxNFxE+WzAZxtyLi3Kz5Rh41CG1Wno4nbNHi2ct5x85YUkhL5LLEqLlxtG
         P3tpK453/REL51loj2tY1DxMggOaZ6Z6bnQ9kGqXmDetj61OpQ3pLJR4Mjc6P7YIj9Xp
         nmYjzoMAicVmUueEm70HBUtNLDNmPd8+OFyopUVr5EeI+JCPrqG3HPrBrQcpJUBK8tIP
         A73CLnIx7YZ9noIJ+B6GNj0Fgfn+Ijy+8KY/2hYLpbfjAeeekkZXnTAWiX1bfa4nWELR
         AS+eN2/lr/x6NNtUO10eMFcax2rFBxDHvdaw5wuvTQc4cS25/XaLhW+y1v5oemWs0Z13
         aUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749737187; x=1750341987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ttsYPqiggEy9hPbgSqnq/DvaBZU+dCuBO6mxXYZ0sE4=;
        b=tgovd5U8h2NCI++fEUxyoLte4HCvG895wp/nKbN4V2w1lAdpXNkuq590nR0AF8fxGA
         nSj0DHVkv6S1BJ7WFAvP5yRtkruagD5uNcJLpMVcv0Qrtxz4tXWS8sJjfmhZ9AC6p4KW
         pxnKnBa5ufGfpS+G+69dP2gaaUvZQOY70rbMnT/00j1BVFmVrbUWEx536KACaFTnR2LG
         /701EPH6WEPlytLkGaJoqHiGggbWf2NPwSfD78CIsmjv2N3azxAp9243GHvQ832q0wV9
         o0mfZXtYv/q0j23GduxRFkQzGQNAZF1WmnudhaZYX22uQnS+fYK1pbbl3HQtXjCH8X2B
         3TOA==
X-Forwarded-Encrypted: i=1; AJvYcCXl3SJyp0kncpsU6Sy05V0AbAAkjYitf3uzyuSP/5cBgRpDKcsc9oUwXi3jqTkHuQjXfA6W/FzQYp9ygw/A5Co=@lists.linux.dev
X-Gm-Message-State: AOJu0YyoKGyP8Zz/ea1K31u+fXtrv0GEynTtZKXV7ViwvMQZQmY0hIfL
	s5acx9mvRq6sovG/W3IYFC9+yit1kX+Hnw6wjp8hPVtNoIoZ7Ck5A4ScKiCurib0qw==
X-Gm-Gg: ASbGncu3mNcYHWgzC21wqZpsuuGB7I8urxx0z5zU7dO9w3vKHUcLJkm+/0kNns4RgXG
	tf9gladHnxY7cOTAZ+TcdC3h12vgeJxO9EN5YkYl9yObz4mGezyao8RgGmMAEK7MdtE1H+rEM9A
	KO28hx0zt4W1/qqRlN6MDhEhRMfanG36u/l7stQOzFmi0VdJvM+dxeJRz1d8ndP44HvCsKcXSUx
	Fci//NuX2FThb9NKh9y0Qnif02oV16zyNVVG+Up35QoXZy3JL1VCs3jN5aJfqHKmPH3waZ2r6YA
	5w919FkStz62agBBDERxgyM0SUKxGqTL5C1o+M0nWPQ98a8UZ4Et9Nd7jkY3lepotZ0xPsxDSji
	VrWLaMNfHh8jmuMBTgrBwsloTDQhKSKyuVbKHtkYJNOgVyv5Wmk+O6e/GTcEBhw==
X-Google-Smtp-Source: AGHT+IFkxe9opO3CgJBFTe03L1s40IzIr7bjzHIvjRy+8Hv/btGAmTqGwq7/h6IW7bgm5G5nDxRvrA==
X-Received: by 2002:a05:6000:401e:b0:3a5:2ec5:35a3 with SMTP id ffacd0b85a97d-3a5607e161amr3093935f8f.45.1749737186805;
        Thu, 12 Jun 2025 07:06:26 -0700 (PDT)
Received: from cyber-t14sg4.sec.9e.network (ip-078-094-000-050.um19.pools.vodafone-ip.de. [78.94.0.50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce6bsm2078875f8f.49.2025.06.12.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:06:26 -0700 (PDT)
From: Michal Gorlas <michal.gorlas@9elements.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>
Cc: marcello.bauer@9elements.com,
	Michal Gorlas <michal.gorlas@9elements.com>,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/3] firmware: coreboot: Support for System Management Interrupt (SMI) handling in coreboot payload (MM payload concept)
Date: Thu, 12 Jun 2025 16:05:47 +0200
Message-ID: <cover.1749734094.git.michal.gorlas@9elements.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

Michal Gorlas (3):
  firmware: coreboot: support for parsing SMM related informations from
    coreboot tables
  firmware: coreboot: loader for Linux-owned SMI handler
  firmware: coreboot: Linux-owned SMI handler to be loaded by coreboot

 drivers/firmware/google/Kconfig               |  12 +
 drivers/firmware/google/Makefile              |  12 +
 drivers/firmware/google/coreboot_table.h      |  34 +-
 drivers/firmware/google/mm_blob.S             |  20 +
 drivers/firmware/google/mm_handler/Makefile   |  51 ++
 .../firmware/google/mm_handler/handler.lds.S  |  46 ++
 .../firmware/google/mm_handler/mm_handler.S   | 510 ++++++++++++++++++
 .../firmware/google/mm_handler/mm_handler.h   |  21 +
 .../firmware/google/mm_handler/mm_header.S    |  19 +
 drivers/firmware/google/mm_info.c             |  63 +++
 drivers/firmware/google/mm_loader.c           | 186 +++++++
 drivers/firmware/google/mm_payload.h          |  58 ++
 12 files changed, 1020 insertions(+), 12 deletions(-)
 create mode 100644 drivers/firmware/google/mm_blob.S
 create mode 100644 drivers/firmware/google/mm_handler/Makefile
 create mode 100644 drivers/firmware/google/mm_handler/handler.lds.S
 create mode 100644 drivers/firmware/google/mm_handler/mm_handler.S
 create mode 100644 drivers/firmware/google/mm_handler/mm_handler.h
 create mode 100644 drivers/firmware/google/mm_handler/mm_header.S
 create mode 100644 drivers/firmware/google/mm_info.c
 create mode 100644 drivers/firmware/google/mm_loader.c
 create mode 100644 drivers/firmware/google/mm_payload.h

-- 
2.49.0

