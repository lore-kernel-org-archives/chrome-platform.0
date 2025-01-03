Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDC417C64
	for <chrome-platform@lists.linux.dev>; Fri,  3 Jan 2025 00:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735863601; cv=none; b=Kq57MDNacUbt8oKZUW/jH6Ifn+iDRbGUJ/h2AhnNLVl6XOd6yiLC604YFYP2JOMj7y64++Y0sWIBQAnGMUGzCbPhFejs9yZq092Yw7B/W9kBZ1IWXWwTXt56WMytpL3XGYazrH1uDrKq/kz+ZYtN8T9L5x7q/24zn5GtvVZrEXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735863601; c=relaxed/simple;
	bh=VTARsa9ubT9Gq+CnQmSNnlK5085LoIO8r5GRwz16lWU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hOWX88mShv38ZHzAaQ65mR1RJkuxkAYZAh630wu/+OjyM9SwCl2R1idu04Xj11ATSwQdA8q0a71IrG8lLyeJvuwcLYKcjTrgAdOa5Kr7gyjfmr0FTsRGwJqJ54T2iwHDYOmIrClhpbfPN0opzzYqf9LNHT9bhgM0smhTE7jb2DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZQXuNxIT; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZQXuNxIT"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee989553c1so16206752a91.3
        for <chrome-platform@lists.linux.dev>; Thu, 02 Jan 2025 16:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1735863599; x=1736468399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ga/+oqzxTMrr1K+wxhfOHEFNCM6WEaRf7ZhNpOKGkRE=;
        b=ZQXuNxITZnAH4nMfzcFcy+s8MM7s9MxFqaCz8PNlE/4vg9Rg8PQP1ADKVaT8zdalRZ
         sT31+SLQaLFB7UgLJhVZMpxVPfpTKIVONOH1YkaYH+MbxXI8aFccpcVNox7laZ37mSW+
         3k501hqIsXihuSXK1+6ENQqZny6bctvCjcEeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735863599; x=1736468399;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ga/+oqzxTMrr1K+wxhfOHEFNCM6WEaRf7ZhNpOKGkRE=;
        b=ll6IcHNO+dt3h1IRHmObDrHEMuHOS1YurQsukgMOMhLeXebHttQD+2BskJpX2qRrLa
         MHZPwlXINHzx41+1T8Yip+vdwrR9z4Bv/kAeJkVlr5kFPU/jrsuJRjJY6dBdfiNzcxSq
         2aTQ4LZt5Ww+FL64kqHqRerq+jXVquDCvIYDytcn25hHK43hBJiWLCa6PXbMqu50xGxP
         hrvWROMJSFQdWFktITKCiCUg+AkyAXd8ai8vPgL6wQ5QiQJEn25gDFr5dOq+CTYp8hHJ
         oAUj8dy5VnjcWtcd14zqUoGaiYOoZ5RbtqYFlbkb+Y6wUK6ZGWTlbF/Clj98tIL4eAqh
         CGmw==
X-Gm-Message-State: AOJu0Yz7CTDT+F5YsF5LxiC8BkUZbL2ITQAQ2K1igOesXmhVuvm0+met
	9R25PsloHVX9ysgNsqkLm4gsNt6jywJjTL4bH3fFnxWW37myHBNgXf4GYmsNuw==
X-Gm-Gg: ASbGnct5m/X20RCVAt1ctkbfVjpbbKNLBkoTJdYTH5ofGctBMJXuy5ZiVT2BbYTQyHu
	65Ty2Ls+Ti6Am+FFhfo2Uqtv5Jy9sJ3DpBiol/23XYuMEjL/SBXV989DTcz5tVRVZXmzlArPQTH
	Lfv5VuxZh1NGRVY9PlU2X9zF2umQKqR5k+DqUoAwCUOYkKZIfNqvx7UP9kWo2RGgDFx07/1avYB
	30VyYPYBM8WKLrHF3vPhetUi/enAVdgzikqvljfCF8Q3I4yxp8ZWCTG
X-Google-Smtp-Source: AGHT+IGNK5e2xpbknJWXafMRqS2yyJfwimoKv+yG6dzOE4d8dPOc80W3o+HEL2fSBKYuIWwK0vb23Q==
X-Received: by 2002:a05:6a00:944b:b0:72a:aa0f:c86e with SMTP id d2e1a72fcca58-72abdd20f48mr61878725b3a.4.1735863599284;
        Thu, 02 Jan 2025 16:19:59 -0800 (PST)
Received: from localhost ([100.107.238.250])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72aad8360fbsm25043613b3a.75.2025.01.02.16.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 16:19:58 -0800 (PST)
From: Gwendal Grignou <gwendal@chromium.org>
To: bleung@chromium.org,
	tzungbi@kernel.org
Cc: chrome-platform@lists.linux.dev,
	dustin@howett.net,
	ben@jubnut.com,
	Gwendal Grignou <gwendal@chromium.org>
Subject: [PATCH 0/2] Add support for IO memory mapped EC
Date: Thu,  2 Jan 2025 16:19:48 -0800
Message-ID: <20250103001950.2868856-1-gwendal@chromium.org>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some EC - Realtek - have their register IO mapped by the BIOS -
coreboot. They are not using the well know io register.

The memory mapping information is retrieved through the ACPI CRS
resource, and is used to access the registers.

To ease the support of these ECs, the global structure and accessor
funcions are now aware of the EC device private structure.

Gwendal Grignou (2):
  platform/chrome: cros_ec_lpc: Merge lpc_driver_ops into ec private
    structure
  platform/chrome: Add Support for direct EC register memory access

 drivers/platform/chrome/cros_ec_lpc.c | 208 ++++++++++++++++++--------
 1 file changed, 144 insertions(+), 64 deletions(-)

-- 
2.47.1.613.gc27f4b7a9f-goog

