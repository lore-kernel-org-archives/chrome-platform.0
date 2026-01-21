Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F96336C0CB;
	Wed, 21 Jan 2026 04:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768970520; cv=none; b=Y9uPWOPGzKW66lJbx969sZMhLdl+He4BDOJ1b7HFzv0r3MHYmhJszMQ0CDUTgNyjsNwDn4JVxgwcIeoRZ5xw7+xaOuccMJb0jwZ+PWxPv+CqNn+moKvb0wWG98lQSKl+n67l3uv/+3ULnP7doZvCSoQfoTbxdJkO2tEs67H4fmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768970520; c=relaxed/simple;
	bh=JYkHxg6XAPQrDohse8sZs+5OkiORxHoAVnE7zi0lm5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mTAs2/ZiCtXeTA4O3w/PpGd3BQyDYvFsAt0nyY3v9htpZMNVZHplrCSZvPJBumAru5Pa9de20YizPMxglbgbCOhYOlu2IZ3mC5cDVTvY8Md1+g7PiYCzce5Nc7t/tDQ63mrV7CHmaYQVFyRs/Za7qHCA/gGw1HP4nPUtYa3+QHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rv1MhICB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rv1MhICB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E1EC116D0;
	Wed, 21 Jan 2026 04:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768970519;
	bh=JYkHxg6XAPQrDohse8sZs+5OkiORxHoAVnE7zi0lm5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rv1MhICB/LKnpfzqNGHwKMT/eufM0IpPdQGeGbdI1BQ38xBFS750hyRLop13udxmN
	 o9ruGc8X0ZR1w0A1qp9wxijivAlDEvG7lud1M2ipOH3zXWl7aEaVmcVq6ZQh+aHRUp
	 b9N1NaYcfrUYFjla1pSc6Bl+wlO1kWfAQC50QNWyEkUDBDuG85F2UueV6erPRrqNyI
	 1PVcP5KqZsXhVCRDh8Wzh+VRPkLEIwj6f39NtgljwXQsuqPG+DLgJe2OSqqMX0lDov
	 +BSw94WRHulzOzgsxY/JcK8RacQwNd34JwjG2keo6OeFCgXSab8K4j3vqvPeaM+tvB
	 pE2PQKt6OtEQA==
Date: Wed, 21 Jan 2026 04:41:56 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
	Benson Leung <bleung@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: Re: [PATCH v1 0/2] platform/chrome: cros_typec_switch: Fix fwnode
 and _ADR handling
Message-ID: <aXBZFMNA02PhtpPF@google.com>
References: <20260120131413.1697891-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120131413.1697891-1-andriy.shevchenko@linux.intel.com>

On Tue, Jan 20, 2026 at 02:12:29PM +0100, Andy Shevchenko wrote:
> While looking for something else, I have noticed a nasty use of the private
> field of struct fwnode_handle in basically the only driver. So, hence the
> fix and one following cleanup.
> 
> Andy Shevchenko (2):
>   platform/chrome: cros_typec_switch: Don't touch  struct
>     fwnode_handle::dev
>   platform/chrome: cros_typec_switch: simplify code with
>     acpi_get_local_u64_address()
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/2] platform/chrome: cros_typec_switch: Don't touch struct fwnode_handle::dev
      commit: e1adf48853bc715f4deea074932aa1c44eb7abea
[2/2] platform/chrome: cros_typec_switch: simplify code with acpi_get_local_u64_address()
      commit: a4065662998fbee4a0ca9886b9aa50aa9694e0e7

Thanks!
