Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABCAA179BD
	for <chrome-platform@lists.linux.dev>; Tue,  4 Feb 2025 02:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738637167; cv=none; b=e00xHidHSJKP0G2pBFuVWYvgZzmxpVynPGKSdwxxNQEH041UFAB2bEvAV/DBkjNCyR5jJDiaABgLB3y7O8mkVUZ8I2IZZUC7VxeZZDaahaHknOvS0LOaBbL5IAb4Qilg38KfngoXGEdbm/MUJ7aeqK49n9C5GnfhVql4iL5uKO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738637167; c=relaxed/simple;
	bh=ABuYKdmygDmdT3733HlG4EilK132xFBMnWKfMpegqkQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=bbX6QygToKtoyNqBbsfEEwEGu6EPcMG8W6HEu9adbk8VSwKBuiuR5t6u+7xkGP33Pq/RQPgk+jChRCySZuLEpW2Z3a2oe/kI9ho1BFq18mkBF6PEVlC/yQLDj5TmjKD0h3sVnyIZo4kI4Qk2SwO1ZHH0h5YInrJMf4dirFjKR1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uzVIFN+e; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uzVIFN+e"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-21f078fc592so442465ad.1
        for <chrome-platform@lists.linux.dev>; Mon, 03 Feb 2025 18:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738637165; x=1739241965; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3GH/JcRbNm1j2lYqDQd4skKZmdc2M9qqSzgaMnEvF+Y=;
        b=uzVIFN+e6v5N9+F70kjyTNOvBkPCoNdDqxBhj0vGatHkJYd6eRtK8AD79v1sNe67r1
         cXAhRDvHhaRKKzJ0GkzlCNMI4QsEW+MTjjEvxQaSDiBruGHJ962CN4/PwnftE2lFD9P/
         wmgN6rD2v4nKo6kulw7MR3teBCXdw3rUa45lv//E5RusYOFHFscemHRMAS8q7NqGFsnz
         js2KTtgVJRnwe7/yfkZ/xC7/FguA4gkiiZXNNvaEzd8NkA7BLqOOdmIFDhZJie5gyQ4a
         RWCp1Jnl3DPfa7pf8ARF5ZAuWSmkg6whFp51XNrjEpShObXEe4lriLe99nK1y5v3oQSW
         YHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738637165; x=1739241965;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GH/JcRbNm1j2lYqDQd4skKZmdc2M9qqSzgaMnEvF+Y=;
        b=sEvtKkb1Qss2/KppeBjY4ix81NziZMxDvCq9fh3V5f+hLK6i5Xlnw87xLIh78UH0zL
         6R21dOVeRL8FyIgXfaPQbdzS8tkJMo9oEw3yCiuvfcCBYL6vaV0C9I9RrnL+gKYM9Kk3
         N9cpvJ+fe7f3fVbcDMjZQDzu2NWi4jOWUFmwgaCFBvtyApg5wdEWQjCIToTsRLfcBa2j
         /xZMAk0Bu4AvYYqiPUae4CK2YhRVJfirN1Icv6alCCOhMFZzRuZhC7Kbbu3wACWu6hnS
         CtA7ZOtUD8dTveiZxDqVHITAZWa9AoDEEQUoLRYWoecKhHixpmW4yGr+Oz6Z0kOPlRCL
         kStg==
X-Forwarded-Encrypted: i=1; AJvYcCXKPnyAUQWpQKvOmw1vDi1jb5yxuM35D4uC0jzAwZF9bmG0S7DlzpLYo9TTQrAWL4CpHL+1zZgSCEgHnX9vj4A=@lists.linux.dev
X-Gm-Message-State: AOJu0YyEtX+tsH77WTxSp0kZ7SohIP8HTAucTJOxLNlwishzNNg8n7lI
	4Ibpwnhs86vevesQeSgflfW9W/g0yTlhlRCsfnpWjcY0O0/814GmCFMhrv3kj5EWSLrBA9E6na6
	mkg==
X-Google-Smtp-Source: AGHT+IEx5DugYqKxLun2tNVq8Y8DNMHlAjnaumoC0xjZC4KgxaIFQeEzH5FH/HcJ6Zp+uFdtspbYxbCKsS8=
X-Received: from pjbov6.prod.google.com ([2002:a17:90b:2586:b0:2ea:5469:76c2])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ce09:b0:217:9172:2ce1
 with SMTP id d9443c01a7336-21dd7d64c77mr426007095ad.22.1738637164915; Mon, 03
 Feb 2025 18:46:04 -0800 (PST)
Date: Tue,  4 Feb 2025 02:45:57 +0000
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204024600.4138776-1-jthies@google.com>
Subject: [PATCH v1 0/2] usb: typec: ucsi: Recover from CrOS EC sysjump
From: Jameson Thies <jthies@google.com>
To: ukaszb@chromium.org, tzungbi@kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev
Cc: bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org, dmitry.baryshkov@linaro.org, 
	abhishekpandit@chromium.org, akuchynski@chromium.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

An EC sysjump can break communication with the cros_ec_ucsi driver by
clearing any previously enabled notifications. This updates the
cros_ec_ucsi driver to monitor for PD initialization events from the EC
and re-enable notifications by treating the init event as a system
resume.

Jameson Thies (2):
  platform/chrome: add PD_EVENT_INIT bit definition
  usb: typec: ucsi: resume work after EC init

 drivers/usb/typec/ucsi/cros_ec_ucsi.c          | 17 ++++++++++++-----
 include/linux/platform_data/cros_ec_commands.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
-- 
2.48.1.362.g079036d154-goog

