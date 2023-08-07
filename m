Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D5C80F
	for <chrome-platform@lists.linux.dev>; Mon,  7 Aug 2023 03:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32BAAC433C8;
	Mon,  7 Aug 2023 03:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691379449;
	bh=wKdfwc6kfrvqe8y2019/qZGu+wca5/9WLqSXMxUeGWc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nrWF6CgrUJ3GPKmGw3w4smUt1lZeb3COOI9bV0DgRR3rJTCe4kWHNoSlIaBrxmKfn
	 CbbGV9TCCqVpkSNIBFmmrWbJsizlqwhrh4AxFK55kke/cR27gzj3keEl01moNUAoPC
	 NdQlyBZU2wec3B+4BaiBmMTFzTMGEU50AhsNWjtD4A7YHchPaAU+yn6pHI9rEd7sbY
	 esPHHsjXGDPcmN0QZqfz3R7uUSbdqd+xA0/91Lr1NtVtDGk+9Sgbda2cs835JagEvl
	 T+svh1XG7/dPtIwnYgQMNYqCuj2mhpPkH5+0Rf3zBP4f5v7C3nj6u7UP/EShjaLG+0
	 DURpHKKiq8DDA==
Date: Mon, 7 Aug 2023 11:37:26 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: bleung@chromium.org, groeck@chromium.org,
	chrome-platform@lists.linux.dev, guillaume.tucker@collabora.com,
	denys.f@collabora.com, ricardo.canuelo@collabora.com,
	briannorris@chromium.org
Subject: Re: [PATCH v2] platform/chrome: chromeos_acpi: print hex string for
 ACPI_TYPE_BUFFER
Message-ID: <ZNBm9lXir2aI10lo@google.com>
References: <20230802095736.3079963-1-tzungbi@kernel.org>
 <1be7888e-2346-99b1-4c31-f755fcbd054a@collabora.com>
 <ZMsBpMDK5iXwFa+S@google.com>
 <f4ae9de4-7b05-a797-087e-d895f7333167@collabora.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4ae9de4-7b05-a797-087e-d895f7333167@collabora.com>

On Thu, Aug 03, 2023 at 09:17:23AM +0500, Muhammad Usama Anjum wrote:
> On 8/3/23 6:23 AM, Tzung-Bi Shih wrote:
> > On Wed, Aug 02, 2023 at 08:15:31PM +0500, Muhammad Usama Anjum wrote:
> >> On 8/2/23 2:57 PM, Tzung-Bi Shih wrote:
> >>> `element->buffer.pointer` should be binary blob.  `%s` doesn't work
> >>> perfect for them.
> >>>
> >>> Print hex string for ACPI_TYPE_BUFFER.
> >>>
> >>> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> >> Please add fixes tag and CC stable as well (stable@vger.kernel.org) in next
> >> revision.
> >>
> >> Fixes: 0a4cad9c11ad ("platform/chrome: Add ChromeOS ACPI device driver")
> > 
> > I think a Fixes tag should be sufficient.
> Why do you think so? As this is a bug fix which exists in the driver since
> it was written, if we add fixes tag and probably cc stable as well, the
> patch will be applied to all LTS kernels which we really want. In this way,
> the bug would be fixed on all LTS kernels not just the latest kernel.

Without the patch, I observed some malfunctions of ChromiumOS userland program
`crossystem`.  There is no kernel crashes and the system is bootable.  Thus, I
think a Fixes tag should be sufficient.
