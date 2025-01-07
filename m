Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E4E1F428E
	for <chrome-platform@lists.linux.dev>; Tue,  7 Jan 2025 17:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736271921; cv=none; b=LVcpyRxENqMgaww3HOXKwfYfYnVsLaEe52WbMwOQ+yMb0VcfswucjJrZQ1N9Et1ZZPs7+CbjFWAZLi3dx+aNZ/v+EWi6/UFmkjxzTI182/ZOTyvopsqsTXcVB9sCciv2Y8G9Mnnr9Qcgodi/FXrw6jZ5crHmVDkWPVEOMSUCEqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736271921; c=relaxed/simple;
	bh=WKVQPUtSsCIltiS2uPheoC1csAGtmgffkis9mgrl6E8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U3vFWAL7uHKQZWZR6IOXiQQjypHreRVfk+9RedFCWAn5lw+69rzg0oPaoqyZMFVEcoNfX5xDrXwR34lkZl4K8q8O+b8BUdYHVhKUWmAOgusi+TCm7juhuW3U5CTuFXpPfh/KnIPK/3VWNTtessXWsGZ02ATSTgVk2D/jhFKkQSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kVQyNBeE; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kVQyNBeE"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216281bc30fso14564445ad.0
        for <chrome-platform@lists.linux.dev>; Tue, 07 Jan 2025 09:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1736271918; x=1736876718; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fO2MPd2BZjubIh5d/VqCmJ92O2YNr50Lj1PXRUoFAc8=;
        b=kVQyNBeEUt1aHNPmP2EovSTNhZuioGHw/z1X6B6rpvQB3EYZV/9BVAfXASun6yHaHV
         M7u8IF41TVAi9oXwQ4ueWAjBfqGscpJbyuE7gB8m5BKWCnQ6f4YbFx8kHtnFFJiK2Vlj
         oghk1SUTQT/3dsxp0HY95ly1+PlCNcqa87iD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736271918; x=1736876718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fO2MPd2BZjubIh5d/VqCmJ92O2YNr50Lj1PXRUoFAc8=;
        b=neELCkyBU/do6Do6KxGGeu4P8tFGrfTTkHV8askHO6xYP55kLPF0qEILWC5swCbyj4
         Di5X6ygZyLQy4cwBrGMao1ACRZ1470MOYTYgQ5sV+beti9CWvp6WIbK29UPtQTVi0ZZE
         jDpce1NfuACppWisP+8nMo6SOi60tXD8bXjraV8SA/DNFSzSMDZefwxxAbU+T5KU/d8Q
         37uz4FFSntHBenAyz4izA48J7lbS2GYO5Ltne6MLKe7c8x8buNIVL/Gpl0Z/buFw0ONP
         9eb3Al2m9CkemlYxFEmgqv2L40tefgGU/M7I4iKH0zo5f+MHQ6aTdwr/OjneQui8EoUh
         6+Jw==
X-Gm-Message-State: AOJu0Yywt2qUr6dgEo5VTnV0g2Buf49ck+mwWrl0P2M81yPC0+OkPaBs
	aD3DgK4zhIx1Fggil/g8h8rdsTWyOOb42JCe3rBKUFmTDUJPh5OXwChhaWCFZA==
X-Gm-Gg: ASbGncs3TWJkQg7oGEbtrgeVw78hZj/Ovuz0HnHLKCfKVP08qg/EX4VLjTYpgR1BcHa
	pgyfKmxe0EoFN2sFz/JmWTM3Ii3fsS+aHDMiU0y84bBVJgo6IdDqWzt4LFtK0K300x1bDgSrYfy
	3axxNPobZDDkwgnInVutzhMKrpbYlCXFiHrqgZyhEZVoJBFhBOAUviG+wnY9F5Kb9E+fqINPXqK
	RF7KfbyPCf9rupXsUSARdc+ZWkD0CKbG4+N1jdo/1UavlUDA8EDwhXf
X-Google-Smtp-Source: AGHT+IFjYOBWFgGIamWY2I+WIn172npvtK+V/AhTe2Lr1CY0HfaWkFddPPo+JD/Hh5TFbAfK4EnQkQ==
X-Received: by 2002:a17:902:ba8c:b0:216:5002:7341 with SMTP id d9443c01a7336-219e6f25fadmr678146755ad.44.1736271918036;
        Tue, 07 Jan 2025 09:45:18 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-219dc9f6922sm315645835ad.223.2025.01.07.09.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:45:17 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	dustin@howett.net,
	ben@jubnut.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH v3 0/2] Add support for IO memory mapped EC
Date: Tue,  7 Jan 2025 09:45:12 -0800
Message-ID: <20250107174514.2748108-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some EC - Realtek - have their register IO mapped by the BIOS -
coreboot. They are not using the well know io register.

The memory mapping information is retrieved through the ACPI CRS
resource, and is used to access the registers.

To ease the support of these ECs, the global structure and accessor
funcions are now aware of the EC device private structure.

Gwendal Grignou (2):
  platform/chrome: cros_ec_lpc: Merge lpc_driver_ops into ec
    private structure
  platform/chrome: cros_ec_lpc: Add Support for direct EC
    register memory access

---
Changes in v3:
  Fix handling of devm_ioremap error
  Reword commit message to be more descriptive.
Changes in v2:
  Removed obvious comments, unnecessary case statement and fix error
  code return.

 drivers/platform/chrome/cros_ec_lpc.c | 203 ++++++++++++++++++--------
 1 file changed, 139 insertions(+), 64 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog

