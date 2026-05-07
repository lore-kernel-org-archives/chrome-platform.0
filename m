Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE44D19992C;
	Thu,  7 May 2026 10:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778151193; cv=none; b=NTlRnCZn2F60A7J51RExLnM101qIV+zZr2/yCIdeNtyLYV39sqxGKC3uEM3wl52sbutrk0SAK8VJTDBOl0RQcjFumulccMHWR/p9h2Cq5Ko+2bXa4Y8ITo3iU6s6GkX0/YBIYsHOZKbTG0It1/LY5R6QrQye+s9FD4o50gUQGH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778151193; c=relaxed/simple;
	bh=2H1gJJ//EnhPUhywy3OuBPHLC+bA4Q0aPkhZ0tHprIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lR/V5KLhU40iumei9nTgKPDw9lR7Gix54gYuGKYV+mg3tCu9cOH8i7g+6X9eeyG+PeMqrnD0UEfaRxTI6VphjlJmy+Foi7dZzGVNpUOYLerqTt4v/HqD8qzjkZDf3m04gslWlEsuZMS8CSmbuif6StO8ykXI4v+JB3WWKdI9YAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/mgDYAE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/mgDYAE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF941C2BCB2;
	Thu,  7 May 2026 10:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778151192;
	bh=2H1gJJ//EnhPUhywy3OuBPHLC+bA4Q0aPkhZ0tHprIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=s/mgDYAExjw8bJP25Zsxnv4ZNHvVm0u2Q7vj1MLvBmKAfNxBU02ZGLvccE/IUviWh
	 6hk9I9jxXnwa7GUUDM1KRzHhNh4VLG+z1meVPZTQRxTtaqw0mBD8AuADUNlhP4r9He
	 kBLz46gCvdMSQ0P55Fu5MH3SImrbNagoMEzLdo8eyoUIJPMxl5O9oi+rPwdqlq9O0X
	 l1mMraHvMUxygk4vvNKC94oYMRALRzr/HSNbDf5nCX6IsMfLW60ve/ZXSc0NaZQdt6
	 4XMMbz7wDI7r5u/9SqA7pmM4xnAge0E44dYawYymMwK291gDkYOPv0VaBCYR1kNx2v
	 Df6bU6gaiHvxg==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, bleung@chromium.org, tzungbi@kernel.org, 
 Jameson Thies <jthies@google.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
 abhishekpandit@chromium.org, akuchynski@chromium.org, ukaszb@chromium.org
In-Reply-To: <20260403222253.1888991-2-jthies@google.com>
References: <20260403222253.1888991-2-jthies@google.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: cros_ec: Don't add cros_ec_ucsi
 if it is defined in OF or ACPI
Message-Id: <177815119043.1773473.13258990074008565353.b4-ty@b4>
Date: Thu, 07 May 2026 11:53:10 +0100
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Fri, 03 Apr 2026 22:22:53 +0000, Jameson Thies wrote:
> On devices with a UCSI PPM in the EC, check for cros_ec_ucsi to be
> defined in the OF device tree or an ACPI node. If it is defined by
> either OF or ACPI, it does not need to be added as a subdevice of
> cros_ec_dev mfd. cros_ec_ucsi will load from the OF or ACPI node.

Applied, thanks!

[1/1] mfd: cros_ec: Don't add cros_ec_ucsi if it is defined in OF or ACPI
      commit: 05f58c8e9b04dad7323a1b824816911baf336ce6

--
Lee Jones [李琼斯]

