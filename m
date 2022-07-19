Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8818A7B
	for <chrome-platform@lists.linux.dev>; Tue, 19 Jul 2022 06:44:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA369C341CA;
	Tue, 19 Jul 2022 06:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1658213052;
	bh=E3bX6qmleWeGq12RkBURl2twNNBfbS4mSd/IGKxbwgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1OSijaaiRloJgzq5lYHvCJGRBoe4rlqxsuUg+pvVXZKa+0MwGfhQA8QkLqhKqjCfY
	 PuOeIdJry8NeReMwXc9QXrHWWFj+OjiChxfiKuCJns9dUdLIRgwS5UX10bJL5HM4UG
	 8FSPhmxT4or3LCKv/XtrcWq439ci7RUOhM0PXZ2I=
Date: Tue, 19 Jul 2022 08:44:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev, bleung@chromium.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] platform/chrome: cros_typec_switch: Add ACPI Kconfig
 dep
Message-ID: <YtZSuI5X96w83S6j@kroah.com>
References: <20220718212754.1129257-1-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220718212754.1129257-1-pmalani@chromium.org>

On Mon, Jul 18, 2022 at 09:27:55PM +0000, Prashant Malani wrote:
> Add the ACPI Kconfig dependency that was missed during the initial
> driver submission. Fixes the following compiler errors:
> 
> drivers/platform/chrome/cros_typec_switch.c:93:9: error: call to
> undeclared function 'acpi_evaluate_integer'; ISO C99 and later do not
> support implicit function declarations
>  [-Wimplicit-function-declaration]
>    ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
> 
> drivers/platform/chrome/cros_typec_switch.c:93:35: error: incomplete
> definition of type 'struct acpi_device'
>    ret = acpi_evaluate_integer(adev->handle, "_ADR", NULL, &index);
> 
> Fixes: e54369058f3d ("platform/chrome: cros_typec_switch: Add switch driver")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
> 
> Changes since v1:
> - Correct the malformed Reported-by tag. No functional changes.
> (Apologies for the quick respin.)

I already have v1 in my tree, so this isn't going to work, sorry.

greg k-h
