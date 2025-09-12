Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641E0289E30
	for <chrome-platform@lists.linux.dev>; Fri, 12 Sep 2025 06:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757660103; cv=none; b=WBVPtbsMpFovoLGcSHZkp43e19Dz+2gFJXW0mxOkBXvW09YIiUOMZj/o/eQfxvfB08eVAaNJhLze4KbmBoLL9EIZjL5ZZ6/5h20+PWbSQOW0Fmz16C9NruvKnmWS7BQUheXnmgtgsc2UtqW5Zm6DIAvvk+ArXyvavCny/Y9aRWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757660103; c=relaxed/simple;
	bh=M8m5mxvOMyfelUhWWg39ciFRBAfkWyQP6AoBvIR/Tlg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V504ZSjY1TfM5V7rRiDT4f6b32K2TsMiNI55A4QjOSMzO630szmj6NhhoCxqTBXkSfZIIJLQwmMA/PHoYZC9+R452NdgdaJuydRvNypLvqLvuVZXDXNsTC7UEe1ArRkaC/p/B60/qXFG1oTTJXqbXx7q8olCjBqd0YJxmccTc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ke1HFowT; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ke1HFowT"
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e98a18faa35so1526733276.0
        for <chrome-platform@lists.linux.dev>; Thu, 11 Sep 2025 23:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1757660100; x=1758264900; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M8m5mxvOMyfelUhWWg39ciFRBAfkWyQP6AoBvIR/Tlg=;
        b=Ke1HFowTqd8Ly8gtdYxFROJ/ptVd4q/lbETUb1BDCZ1E36+5DKFerWmkapijx4u9XE
         FeSBf8Ym+kApE1nvSnCG9B9UnV3E34ZhI6GUsYu5eXq7HY1Xjxn2rjrLDvVxkK+aNNbW
         NfMlCMEhg7bco+EcSH9eLukEhtToO9/oUXV7EH3cdnIaE1JBO+h8ZgU6EBWL8Q/W7wB6
         1KOPYVDR8fGeJgLZWfqs9vTH+copVID5dV9rVC4NFcPL24tliMbgyuJCFAAxEFj+4PUa
         pYlqHWqQJh7AKwHMtOtgjNmqMKBhpaqypZqeN1bbBegHPkbzYQ6zA9PFKOccfSvrdndS
         dRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757660100; x=1758264900;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M8m5mxvOMyfelUhWWg39ciFRBAfkWyQP6AoBvIR/Tlg=;
        b=gmd9GUPVjGg2a+01rEXef6Y4e9G86cD/OefRCFpqxukK5d2KRKBXhmt7UhPo3E8wq0
         4L4aGDCJsEEzU96uCoajE7mLiGfZv6g204mF6NxL/DCGAmMOGnxLaew/n0cHRgCppCAc
         gSwMnIGiYfnvnK30DiQqA5TPDLODjb+EE60JYkrqulWJ8McvvSRViGnHn+G6UYEu9apl
         Atys80kbJAhIMLtdeHsx4L/Pl6szFFHwoWR7QqqG1zNBjZetsDu05yFqBhsxCNPG/54f
         mmYc2QehbrLdzmlXrU/N2L/wCDTuqQ4AhMqVFL/TFQMq8YBrwhVBohnLNWo21bW9pL8p
         J17Q==
X-Forwarded-Encrypted: i=1; AJvYcCVa+/rkZFiVplkEtLQVt2GdMRSqFLDEr6pBgl71oVBEmepE6LWDic7gx8vL1MvJu5+RvZ2qlJKyPGIBNOEVuzI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxQnOsAtMBCgDDmqgqbSXad89z1CpbvItSOSL6XBaU5x4SF1giM
	4AJ3FCeVCLgMyeiFTgTfWwfQm4OspJiAQdyA0qoNCA5oPCzUuT8R3QGEuk2ohusZ5FzyfZDBezJ
	IJyzjOzZIv1QqdWIPKc5m++muFlp9gRb8st/vihOp
X-Gm-Gg: ASbGncsYWwCD40Y+b0m6lYeroZpOoy1eid8RIbSUnCZaiNz+nYNXUht7rLl8CSnDuMQ
	TGK62LQ09iSvWzJIZPnB21QwUYCgu+sZIS+Q7zoinQs4EGBJXY8fFOavq1R/Ui0OBWUjq1iQRN8
	uaUag5c6NL+q80AmqH8SBtAG7vDKxNJHMIAzJWmrQXUaYR7FNk6hZ4gZZUddMNdxFX6mtSWCnOp
	3BIU7OgbbYsMCFhbGqJIPxVhLNZDL9eKXuQ
X-Google-Smtp-Source: AGHT+IEyMQa4qPU0KE+hX3RYmz5N48S+SV/AkytOR7opAhUTIZtTp8BRPBVeAijhywoAi5QY2RgyFCQKocEt1JvkAAg=
X-Received: by 2002:a05:690e:250d:20b0:628:df16:3193 with SMTP id
 956f58d0204a3-628df1632fcmr325353d50.24.1757660100065; Thu, 11 Sep 2025
 23:55:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250912052919.229757-1-dawidn@google.com> <aMPDLn05CwwEX9EI@visitorckw-System-Product-Name>
In-Reply-To: <aMPDLn05CwwEX9EI@visitorckw-System-Product-Name>
From: =?UTF-8?Q?Dawid_Nied=C5=BAwiecki?= <dawidn@google.com>
Date: Fri, 12 Sep 2025 08:54:48 +0200
X-Gm-Features: Ac12FXxhLIZGITrboDgd4uyjaz3guDR8AnkdH_jhjnU-k6vLaKjKkR01rcCS3ow
Message-ID: <CAJ_BA_CW0ytJjym4=v7JQMbdzg3Ny7uVwrz20RADiyjk7cJ=TQ@mail.gmail.com>
Subject: Re: [PATCH v5] platform/chrome: Add ChromeOS EC USB driver
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Benson Leung <bleung@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chromeos-krk-upstreaming@google.com, =?UTF-8?Q?=C5=81ukasz_Bartosik?= <ukaszb@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Very sorry, my bad. Something went wrong with my git/editor.

I just sent the correction in V6.

BR,
Dawid
